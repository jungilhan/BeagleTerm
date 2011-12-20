#ifndef SSHTERMINAL_H_
#define SSHTERMINAL_H_

#define SSH_NO_CPP_EXCEPTIONS
#include "libssh/libsshpp.hpp"

#include <string>

class SSHTerminal {
public:
    SSHTerminal();
    virtual ~SSHTerminal();

    int connect(const std::string& host, const std::string& port, const std::string& user);
    void disconnect();

    int verifyKnownHost(std::string& error);
    int writeKnownHost();
    int userauthPassword(const std::string& password);

    int write(char keyCode);
    std::string read();

private:
    void init();
    void cleanup();

private:
    ssh::Session m_session;
    ssh::Channel* m_channel;
};

#endif /* SSHTERMINAL_H_ */

