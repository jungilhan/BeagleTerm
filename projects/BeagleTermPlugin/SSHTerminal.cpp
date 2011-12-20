#include "SSHTerminal.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <errno.h>
#include <iostream>

//#define FILE_LOG
#define SAFE_DELETE(x) if ((x) != NULL) { delete x; x = NULL; }

SSHTerminal::SSHTerminal() : m_channel(new ssh::Channel(m_session))
{
    std::cout << "[BeagleTermPlugin::SSHTerminal]" << std::endl;
    init();
}

SSHTerminal::~SSHTerminal()
{
    std::cout << "[BeagleTermPlugin::~SSHTerminal]" << std::endl;
    cleanup();
}

void SSHTerminal::init()
{

}

void SSHTerminal::cleanup()
{
    disconnect();
}

int SSHTerminal::connect(const std::string& host, const std::string& port, const std::string& user)
{
    std::cout << "[INFO] connect: " << user << "@" << host << ":" << port << std::endl;

    if (m_session.isConnected())
        return -1;

    if (host.empty() || port.empty() || user.empty())
        return -1;

    m_session.setOption(SSH_OPTIONS_HOST, host.c_str());
    m_session.setOption(SSH_OPTIONS_PORT_STR, port.c_str());
    m_session.setOption(SSH_OPTIONS_USER, user.c_str());

    m_session.connect();
    return 0;
}

void SSHTerminal::disconnect()
{
    if (m_channel && m_channel->isOpen()) {
        m_channel->sendEof();
        m_channel->close();

        SAFE_DELETE(m_channel);
    }

    if (m_session.isConnected())
        m_session.silentDisconnect();
}

int SSHTerminal::verifyKnownHost(std::string& error)
{
    unsigned char* hash = NULL;
    char* hexa = NULL;
    int retCode = 0; // 0: known host, 1: unknown host, -1: error

    int length = m_session.getPubKeyHash(&hash);
    if (hash && length > 0)
        hexa = ssh_get_hexa(hash, length);

    int state = m_session.isServerKnown();
    switch (state) {
    case SSH_SERVER_KNOWN_OK:
        break;
    case SSH_SERVER_KNOWN_CHANGED:
        retCode = -1;

        fprintf(stderr, "Host key for server changed : server's one is now :\n");
        fprintf(stderr, "Public key hash is %s\n", hexa);
        fprintf(stderr, "For security reason, connection will be stopped\n");

        error = "Host key for server changed : server's one is now :\n";
        error += "Public key hash: ";
        error += std::string(hexa, strlen(hexa)) + "\n";
        error += "For security reason, connection will be stopped\n";
        break;
    case SSH_SERVER_FOUND_OTHER:
        retCode = -1;

        fprintf(stderr, "The host key for this server was not found but an other type of key exists.\n");
        fprintf(stderr, "An attacker might change the default server key to confuse your client"
                        "into thinking the key does not exist\n"
                        "We advise you to rerun the client with -d or -r for more safety.\n");

        error = "The host key for this server was not found but an other type of key exists.\n";
        error += "An attacker might change the default server key to confuse your client";
        error += "into thinking the key does not exist\n";
        error += "We advise you to rerun the client with -d or -r for more safety.\n";
        break;
    case SSH_SERVER_FILE_NOT_FOUND:
        fprintf(stderr, "Could not find known host file. If you accept the host key here,\n");
        fprintf(stderr, "the file will be automatically created.\n");

        error = "Could not find known host file. If you accept the host key here,\n";
        error += "the file will be automatically created.\n";
    case SSH_SERVER_NOT_KNOWN:
        retCode = 1;

        fprintf(stderr, "The server is unknown.\n");
        fprintf(stderr, "Public key hash is %s\n", hexa);
        fprintf(stderr, "Do you trust the host key (yes/no)? ");

        error = "The server is unknown.\n";
        error += "Public key hash is ";
        error += std::string(hexa, strlen(hexa)) + "\n";
        error += "Do you trust the host key?";
        break;
    case SSH_SERVER_ERROR:
        retCode = -1;

        error = m_session.getError();
        fprintf(stderr, "%s", error.c_str());
        break;
    } // switch

    if (hexa)
        ssh_string_free_char(hexa);
    ssh_clean_pubkey_hash(&hash);

    return retCode;
}

int SSHTerminal::writeKnownHost()
{
    if (m_session.writeKnownhost() < 0) {
        fprintf(stderr, "[SSHTerminal::writeKnownHost] error %s\n", strerror(errno));
        return -1;
    }

    return 0;
}

int SSHTerminal::userauthPassword(const std::string& password)
{
    if (m_channel && m_channel->isOpen())
        return -1;

    m_session.userauthNone();

    switch (m_session.userauthPassword(password.c_str())) {
    case SSH_AUTH_SUCCESS:
        m_channel->openSession();
        m_channel->requestPty();
        m_channel->changePtySize(237, 58); // 1920 x 1080
        m_channel->requestShell();
        break;

    case SSH_AUTH_DENIED:
    case SSH_AUTH_PARTIAL:
    default:
        fprintf(stderr, "[SSHTerminal::userauthPassword] %s", m_session.getError());
        return -1;
    }

    return 0;
}

int SSHTerminal::write(char keyCode)
{
    if (!m_session.isConnected())
        return -1;

    if (!m_channel && (!m_channel->isOpen() || m_channel->isEof()))
        return -1;

    return m_channel->write(&keyCode, sizeof(char));
}

std::string SSHTerminal::read()
{
    if (!m_session.isConnected())
        return std::string("SSH_CHANNEL_DISCONNECTED");

    if (!m_channel && (!m_channel->isOpen() || m_channel->isEof()))
        return std::string("SSH_CHANNEL_DISCONNECTED");

    int readBytes;
    char buffer[4096];
    std::string stream;

#ifdef FILE_LOG
    FILE* log = fopen("terminal.log", "a");
#endif

    while ((readBytes = m_channel->readNonblocking(buffer, sizeof(buffer), false)) > 0) {
        if (readBytes) {
            stream += std::string(buffer, readBytes);

#ifdef FILE_LOG
            fwrite(stream.c_str(), readBytes, 1, log);
#endif
        } else {
            m_channel->sendEof();
            return std::string("SSH_CHANNEL_DISCONNECTED");
        }
    }

#ifdef FILE_LOG
    fclose(log);
#endif

    if (!stream.empty())
        std::cout << stream << std::endl;

    return stream;
}
