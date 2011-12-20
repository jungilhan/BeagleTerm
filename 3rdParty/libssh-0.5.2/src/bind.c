/*
 * bind.c : all ssh_bind functions
 *
 * This file is part of the SSH Library
 *
 * Copyright (c) 2004-2005 by Aris Adamantiadis
 *
 * The SSH Library is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or (at your
 * option) any later version.
 *
 * The SSH Library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with the SSH Library; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
 * MA 02111-1307, USA.
 */


#include "config.h"

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "libssh/priv.h"
#include "libssh/bind.h"
#include "libssh/libssh.h"
#include "libssh/server.h"
#include "libssh/keyfiles.h"
#include "libssh/buffer.h"
#include "libssh/socket.h"
#include "libssh/session.h"

/**
 * @addtogroup libssh_server
 *
 * @{
 */


#ifdef _WIN32
#include <io.h>
#include <winsock2.h>
#include <ws2tcpip.h>

/*
 * <wspiapi.h> is necessary for getaddrinfo before Windows XP, but it isn't
 * available on some platforms like MinGW.
 */
#ifdef HAVE_WSPIAPI_H
# include <wspiapi.h>
#endif

#define SOCKOPT_TYPE_ARG4 char

/*
 * We need to provide hstrerror. Not we can't call the parameter h_errno
 * because it's #defined
 */
static char *hstrerror(int h_errno_val) {
  static char text[50] = {0};

  snprintf(text, sizeof(text), "getaddrino error %d\n", h_errno_val);

  return text;
}
#else /* _WIN32 */

#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#define SOCKOPT_TYPE_ARG4 int

#endif /* _WIN32 */

static socket_t bind_socket(ssh_bind sshbind, const char *hostname,
    int port) {
    char port_c[6];
    struct addrinfo *ai;
    struct addrinfo hints;
    int opt = 1;
    socket_t s;
    int rc;

    ZERO_STRUCT(hints);

    hints.ai_flags = AI_PASSIVE;
    hints.ai_socktype = SOCK_STREAM;

    snprintf(port_c, 6, "%d", port);
    rc = getaddrinfo(hostname, port_c, &hints, &ai);
    if (rc != 0) {
        ssh_set_error(sshbind,
                      SSH_FATAL,
                      "Resolving %s: %s", hostname, gai_strerror(rc));
        return -1;
    }

    s = socket (ai->ai_family,
                           ai->ai_socktype,
                           ai->ai_protocol);
    if (s == SSH_INVALID_SOCKET) {
        ssh_set_error(sshbind, SSH_FATAL, "%s", strerror(errno));
        freeaddrinfo (ai);
        return -1;
    }

    if (setsockopt(s, SOL_SOCKET, SO_REUSEADDR,
                   (char *)&opt, sizeof(opt)) < 0) {
        ssh_set_error(sshbind,
                      SSH_FATAL,
                      "Setting socket options failed: %s",
                      hstrerror(h_errno));
        freeaddrinfo (ai);
        close(s);
        return -1;
    }

    if (bind(s, ai->ai_addr, ai->ai_addrlen) != 0) {
        ssh_set_error(sshbind,
                      SSH_FATAL,
                      "Binding to %s:%d: %s",
                      hostname,
                      port,
                      strerror(errno));
        freeaddrinfo (ai);
        close(s);
        return -1;
    }

    freeaddrinfo (ai);
    return s;
}

ssh_bind ssh_bind_new(void) {
  ssh_bind ptr;

  ptr = malloc(sizeof(struct ssh_bind_struct));
  if (ptr == NULL) {
    return NULL;
  }
  ZERO_STRUCTP(ptr);
  ptr->bindfd = SSH_INVALID_SOCKET;
  ptr->bindport= 22;
  ptr->log_verbosity = 0;

  return ptr;
}

int ssh_bind_listen(ssh_bind sshbind) {
  const char *host;
  socket_t fd;

  if (ssh_init() < 0) {
    ssh_set_error(sshbind, SSH_FATAL, "ssh_init() failed");
    return -1;
  }

  host = sshbind->bindaddr;
  if (host == NULL) {
    host = "0.0.0.0";
  }

  fd = bind_socket(sshbind, host, sshbind->bindport);
  if (fd == SSH_INVALID_SOCKET) {
    return -1;
  }
  sshbind->bindfd = fd;

  if (listen(fd, 10) < 0) {
    ssh_set_error(sshbind, SSH_FATAL,
        "Listening to socket %d: %s",
        fd, strerror(errno));
    close(fd);
    return -1;
  }

  return 0;
}

int ssh_bind_set_callbacks(ssh_bind sshbind, ssh_bind_callbacks callbacks,
    void *userdata){
  if (sshbind == NULL) {
    return SSH_ERROR;
  }
  if (callbacks == NULL) {
    ssh_set_error_invalid(sshbind, __FUNCTION__);
    return SSH_ERROR;
  }
  if(callbacks->size <= 0 || callbacks->size > 1024 * sizeof(void *)){
    ssh_set_error(sshbind,SSH_FATAL,
        "Invalid callback passed in (badly initialized)");
    return SSH_ERROR;
  }
  sshbind->bind_callbacks = callbacks;
  sshbind->bind_callbacks_userdata=userdata;
  return 0;
}

/** @internal
 * @brief callback being called by poll when an event happens
 *
 */
static int ssh_bind_poll_callback(ssh_poll_handle sshpoll,
    socket_t fd, int revents, void *user){
  ssh_bind sshbind=(ssh_bind)user;
  (void)sshpoll;
  (void)fd;

  if(revents & POLLIN){
    /* new incoming connection */
    if(ssh_callbacks_exists(sshbind->bind_callbacks,incoming_connection)){
      sshbind->bind_callbacks->incoming_connection(sshbind,
          sshbind->bind_callbacks_userdata);
    }
  }
  return 0;
}

/** @internal
 * @brief returns the current poll handle, or create it
 * @param sshbind the ssh_bind object
 * @returns a ssh_poll handle suitable for operation
 */
ssh_poll_handle ssh_bind_get_poll(ssh_bind sshbind){
  if(sshbind->poll)
    return sshbind->poll;
  sshbind->poll=ssh_poll_new(sshbind->bindfd,POLLIN,
      ssh_bind_poll_callback,sshbind);
  return sshbind->poll;
}

void ssh_bind_set_blocking(ssh_bind sshbind, int blocking) {
  sshbind->blocking = blocking ? 1 : 0;
}

socket_t ssh_bind_get_fd(ssh_bind sshbind) {
  return sshbind->bindfd;
}

void ssh_bind_set_fd(ssh_bind sshbind, socket_t fd) {
  sshbind->bindfd = fd;
}

void ssh_bind_fd_toaccept(ssh_bind sshbind) {
  sshbind->toaccept = 1;
}

void ssh_bind_free(ssh_bind sshbind){
  int i;

  if (sshbind == NULL) {
    return;
  }

  if (sshbind->bindfd >= 0) {
#ifdef _WIN32
    closesocket(sshbind->bindfd);
#else
    close(sshbind->bindfd);
#endif
  }
  sshbind->bindfd = SSH_INVALID_SOCKET;

  /* options */
  SAFE_FREE(sshbind->banner);
  SAFE_FREE(sshbind->dsakey);
  SAFE_FREE(sshbind->rsakey);
  SAFE_FREE(sshbind->bindaddr);

  for (i = 0; i < 10; i++) {
    if (sshbind->wanted_methods[i]) {
      SAFE_FREE(sshbind->wanted_methods[i]);
    }
  }

  SAFE_FREE(sshbind);
}


int ssh_bind_accept(ssh_bind sshbind, ssh_session session) {
  ssh_private_key dsa = NULL;
  ssh_private_key rsa = NULL;
  socket_t fd = SSH_INVALID_SOCKET;
  int i;

  if (sshbind->bindfd == SSH_INVALID_SOCKET) {
    ssh_set_error(sshbind, SSH_FATAL,
        "Can't accept new clients on a not bound socket.");
    return SSH_ERROR;
  }
  if(session == NULL){
  	ssh_set_error(sshbind, SSH_FATAL,"session is null");
  	return SSH_ERROR;
  }
  if (sshbind->dsakey == NULL && sshbind->rsakey == NULL) {
    ssh_set_error(sshbind, SSH_FATAL,
        "DSA or RSA host key file must be set before accept()");
    return SSH_ERROR;
  }

  if (sshbind->dsakey) {
    dsa = _privatekey_from_file(sshbind, sshbind->dsakey, SSH_KEYTYPE_DSS);
    if (dsa == NULL) {
      return SSH_ERROR;
    }
  }

  if (sshbind->rsakey) {
    rsa = _privatekey_from_file(sshbind, sshbind->rsakey, SSH_KEYTYPE_RSA);
    if (rsa == NULL) {
      privatekey_free(dsa);
      return SSH_ERROR;
    }
  }

  fd = accept(sshbind->bindfd, NULL, NULL);
  if (fd == SSH_INVALID_SOCKET) {
    ssh_set_error(sshbind, SSH_FATAL,
        "Accepting a new connection: %s",
        strerror(errno));
    privatekey_free(dsa);
    privatekey_free(rsa);
    return SSH_ERROR;
  }

  session->server = 1;
  session->version = 2;

  /* copy options */
  for (i = 0; i < 10; ++i) {
    if (sshbind->wanted_methods[i]) {
      session->wanted_methods[i] = strdup(sshbind->wanted_methods[i]);
      if (session->wanted_methods[i] == NULL) {
        privatekey_free(dsa);
        privatekey_free(rsa);
        return SSH_ERROR;
      }
    }
  }

  if (sshbind->bindaddr == NULL)
    session->bindaddr = NULL;
  else {
    SAFE_FREE(session->bindaddr);
    session->bindaddr = strdup(sshbind->bindaddr);
    if (session->bindaddr == NULL) {
      privatekey_free(dsa);
      privatekey_free(rsa);
      return SSH_ERROR;
    }
  }

  session->log_verbosity = sshbind->log_verbosity;

  ssh_socket_free(session->socket);
  session->socket = ssh_socket_new(session);
  if (session->socket == NULL) {
    /* perhaps it may be better to copy the error from session to sshbind */
    ssh_set_error_oom(sshbind);
    privatekey_free(dsa);
    privatekey_free(rsa);
    return SSH_ERROR;
  }
  ssh_socket_set_fd(session->socket, fd);
  ssh_socket_get_poll_handle_out(session->socket);
  session->dsa_key = dsa;
  session->rsa_key = rsa;

return SSH_OK;
}


/**
 * @}
 */
