/**********************************************************\

  Auto-generated BeagleTermPluginAPI.cpp

\**********************************************************/

#include "JSObject.h"
#include "variant_list.h"
#include "DOM/Document.h"
#include "global/config.h"

#include "BeagleTermPluginAPI.h"
#include "SSHTerminal.h"
//#include "SSHTerminal.hpp"

#include <iostream>
#include <stdio.h>

///////////////////////////////////////////////////////////////////////////////
/// @fn BeagleTermPluginAPI::BeagleTermPluginAPI(const BeagleTermPluginPtr& plugin, const FB::BrowserHostPtr host)
///
/// @brief  Constructor for your JSAPI object.  You should register your methods, properties, and events
///         that should be accessible to Javascript from here.
///
/// @see FB::JSAPIAuto::registerMethod
/// @see FB::JSAPIAuto::registerProperty
/// @see FB::JSAPIAuto::registerEvent
///////////////////////////////////////////////////////////////////////////////
BeagleTermPluginAPI::BeagleTermPluginAPI(const BeagleTermPluginPtr& plugin, const FB::BrowserHostPtr& host) : m_plugin(plugin), m_host(host)
{
    std::cout << "[BeagleTermPluginAPI::BeagleTermPluginAPI] " << std::endl;

    // Properties
    registerProperty("host", make_property(this, &BeagleTermPluginAPI::getUrl, &BeagleTermPluginAPI::setUrl));
    registerProperty("port", make_property(this, &BeagleTermPluginAPI::getPort, &BeagleTermPluginAPI::setPort));
    registerProperty("user", make_property(this, &BeagleTermPluginAPI::getUser, &BeagleTermPluginAPI::setUser));
    registerProperty("error", make_property(this, &BeagleTermPluginAPI::getError));

    // Methods
    registerMethod("connect",  make_method(this, &BeagleTermPluginAPI::connect));
    registerMethod("disconnect",  make_method(this, &BeagleTermPluginAPI::disconnect));
    registerMethod("verifyKnownHost",  make_method(this, &BeagleTermPluginAPI::verifyKnownHost));
    registerMethod("writeKnownHost",  make_method(this, &BeagleTermPluginAPI::writeKnownHost));
    registerMethod("userauthPassword",  make_method(this, &BeagleTermPluginAPI::userauthPassword));
    registerMethod("write",  make_method(this, &BeagleTermPluginAPI::write));
    registerMethod("read",  make_method(this, &BeagleTermPluginAPI::read));
}

///////////////////////////////////////////////////////////////////////////////
/// @fn BeagleTermPluginAPI::~BeagleTermPluginAPI()
///
/// @brief  Destructor.  Remember that this object will not be released until
///         the browser is done with it; this will almost definitely be after
///         the plugin is released.
///////////////////////////////////////////////////////////////////////////////
BeagleTermPluginAPI::~BeagleTermPluginAPI()
{
}

///////////////////////////////////////////////////////////////////////////////
/// @fn BeagleTermPluginPtr BeagleTermPluginAPI::getPlugin()
///
/// @brief  Gets a reference to the plugin that was passed in when the object
///         was created.  If the plugin has already been released then this
///         will throw a FB::script_error that will be translated into a
///         javascript exception in the page.
///////////////////////////////////////////////////////////////////////////////
BeagleTermPluginPtr BeagleTermPluginAPI::getPlugin()
{
    BeagleTermPluginPtr plugin(m_plugin.lock());
    if (!plugin) {
        throw FB::script_error("The plugin is invalid");
    }
    return plugin;
}

std::string BeagleTermPluginAPI::getUrl()
{
    return m_url;
}

void BeagleTermPluginAPI::setUrl(const std::string& url)
{
    m_url = url;
}

std::string BeagleTermPluginAPI::getPort()
{
    return m_port;
}

void BeagleTermPluginAPI::setPort(const std::string& port)
{
    m_port = port;
}

std::string BeagleTermPluginAPI::getUser()
{
    return m_user;
}

void BeagleTermPluginAPI::setUser(const std::string& user)
{
    m_user = user;
}

std::string BeagleTermPluginAPI::getError()
{
    return m_error;
}

void BeagleTermPluginAPI::connect(const std::string& host, const std::string& port, const boost::optional<std::string> user)
{
    if (user.is_initialized()) {
        m_url = host;
        m_user = user.get();
    } else {
        m_url = tokenizeHost(host);
        m_user = tokenizeUser(host);
    }

    m_port = port;
    std::cout << "[BeagleTermPluginAPI::connect] " << m_user + "@" + m_url + ":" + m_port<< std::endl;

    getPlugin()->getTerminal()->connect(m_url, m_port, m_user);
}

void BeagleTermPluginAPI::disconnect()
{
    std::cout << "[BeagleTermPluginAPI::disconnect] " << std::endl;

    getPlugin()->getTerminal()->disconnect();
}

int BeagleTermPluginAPI::verifyKnownHost()
{
    std::cout << "[BeagleTermPluginAPI::verifyKnownHost] " << std::endl;

    return getPlugin()->getTerminal()->verifyKnownHost(m_error);
}

int BeagleTermPluginAPI::writeKnownHost()
{
    std::cout << "[BeagleTermPluginAPI::writeKnownHost] " << std::endl;

    return getPlugin()->getTerminal()->writeKnownHost();
}

int BeagleTermPluginAPI::userauthPassword(const std::string& password)
{
    std::cout << "[BeagleTermPluginAPI::userauthPassword] " << password << std::endl;

    return getPlugin()->getTerminal()->userauthPassword(password);
}

int BeagleTermPluginAPI::write(int keyCode)
{
    std::cout << "[BeagleTermPluginAPI::write] " << keyCode << " 0x" << std::hex << keyCode << std::endl;


    return getPlugin()->getTerminal()->write(static_cast<char>(keyCode));
}

std::string BeagleTermPluginAPI::read()
{
    std::cout << "[BeagleTermPluginAPI::read] " << std::endl;

    return getPlugin()->getTerminal()->read();
}

std::string BeagleTermPluginAPI::tokenizeHost(std::string userNHost)
{
    std::string host;

    int index = userNHost.find("@");
    if (index >= 0) {
        host = userNHost.substr(index + 1);
    } else {
        fprintf(stderr, "[BeagleTermPluginAPI::tokenizeHost] Invalid value of token: %s\n", userNHost.c_str());
    }

    return host;
}

std::string BeagleTermPluginAPI::tokenizeUser(std::string userNHost)
{
    std::string user;

    int index = userNHost.find("@");
    if (index >= 0) {
        user = userNHost.substr(0, index);
    } else {
        fprintf(stderr, "[BeagleTermPluginAPI::tokenizeUser] Invalid value of token: %s\n", userNHost.c_str());
    }

    return user;
}
