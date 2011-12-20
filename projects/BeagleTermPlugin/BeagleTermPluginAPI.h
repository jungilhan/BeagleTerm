/**********************************************************\

  Auto-generated BeagleTermPluginAPI.h

\**********************************************************/

#include <string>
#include <sstream>
#include <boost/weak_ptr.hpp>
#include "JSAPIAuto.h"
#include "BrowserHost.h"
#include "BeagleTermPlugin.h"

#ifndef H_BeagleTermPluginAPI
#define H_BeagleTermPluginAPI

class BeagleTermPluginAPI : public FB::JSAPIAuto
{
public:
    BeagleTermPluginAPI(const BeagleTermPluginPtr& plugin, const FB::BrowserHostPtr& host);
    virtual ~BeagleTermPluginAPI();

    BeagleTermPluginPtr getPlugin();

    std::string getUrl();
    void setUrl(const std::string& url);

    std::string getPort();
    void setPort(const std::string& port);

    std::string getUser();
    void setUser(const std::string& user);

    std::string getError();

    void connect(const std::string& host, const std::string& port, const boost::optional<std::string> user);
    void disconnect();
    int verifyKnownHost();
    int writeKnownHost();
    int userauthPassword(const std::string& password);
    int write(int keyCode);
    std::string read();

private:
    std::string tokenizeHost(std::string userNHost);
    std::string tokenizeUser(std::string userNHost);

private:
    BeagleTermPluginWeakPtr m_plugin;
    FB::BrowserHostPtr m_host;

    std::string m_url;
    std::string m_port;
    std::string m_user;

    std::string m_error;
};

#endif // H_BeagleTermPluginAPI

