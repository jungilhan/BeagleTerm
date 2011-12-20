/**********************************************************\

  Auto-generated BeagleTermPlugin.cpp

  This file contains the auto-generated main plugin object
  implementation for the Beagle Term Plugin project

\**********************************************************/

#include "BeagleTermPluginAPI.h"
#include "BeagleTermPlugin.h"

#include <iostream>
#include <assert.h>

#include "SSHTerminal.h"
//#include "SSHTerminal.hpp"

///////////////////////////////////////////////////////////////////////////////
/// @fn BeagleTermPlugin::StaticInitialize()
///
/// @brief  Called from PluginFactory::globalPluginInitialize()
///
/// @see FB::FactoryBase::globalPluginInitialize
///////////////////////////////////////////////////////////////////////////////
void BeagleTermPlugin::StaticInitialize()
{
    // Place one-time initialization stuff here; As of FireBreath 1.4 this should only
    // be called once per process
		std::cout << "[BeagleTermPlugin::StaticInitialize]" << std::endl;
}

///////////////////////////////////////////////////////////////////////////////
/// @fn BeagleTermPlugin::StaticInitialize()
///
/// @brief  Called from PluginFactory::globalPluginDeinitialize()
///
/// @see FB::FactoryBase::globalPluginDeinitialize
///////////////////////////////////////////////////////////////////////////////
void BeagleTermPlugin::StaticDeinitialize()
{
    // Place one-time deinitialization stuff here. As of FireBreath 1.4 this should
    // always be called just before the plugin library is unloaded
    std::cout << "[BeagleTermPlugin::StaticDeinitialize]" << std::endl;
}

///////////////////////////////////////////////////////////////////////////////
/// @brief  BeagleTermPlugin constructor.  Note that your API is not available
///         at this point, nor the window.  For best results wait to use
///         the JSAPI object until the onPluginReady method is called
///////////////////////////////////////////////////////////////////////////////
BeagleTermPlugin::BeagleTermPlugin()
{
    m_terminal = 0;
}

///////////////////////////////////////////////////////////////////////////////
/// @brief  BeagleTermPlugin destructor.
///////////////////////////////////////////////////////////////////////////////
BeagleTermPlugin::~BeagleTermPlugin()
{
    // This is optional, but if you reset m_api (the shared_ptr to your JSAPI
    // root object) and tell the host to free the retained JSAPI objects then
    // unless you are holding another shared_ptr reference to your JSAPI object
    // they will be released here.
    releaseRootJSAPI();
    m_host->freeRetainedObjects();
}

void BeagleTermPlugin::onPluginReady()
{
    // When this is called, the BrowserHost is attached, the JSAPI object is
    // created, and we are ready to interact with the page and such.  The
    // PluginWindow may or may not have already fire the AttachedEvent at
    // this point.
    std::cout << "[BeagleTermPlugin::onPluginReady]" << std::endl;

		assert(!m_terminal);
		m_terminal = new SSHTerminal();
}

void BeagleTermPlugin::shutdown()
{
    // This will be called when it is time for the plugin to shut down;
    // any threads or anything else that may hold a shared_ptr to this
    // object should be released here so that this object can be safely
    // destroyed. This is the last point that shared_from_this and weak_ptr
    // references to this object will be valid
    std::cout << "[BeagleTermPlugin::shutdown]" << std::endl;

		if (m_terminal) {
		    delete m_terminal;
		    m_terminal = 0;
		}
}

///////////////////////////////////////////////////////////////////////////////
/// @brief  Creates an instance of the JSAPI object that provides your main
///         Javascript interface.
///
/// Note that m_host is your BrowserHost and shared_ptr returns a
/// FB::PluginCorePtr, which can be used to provide a
/// boost::weak_ptr<BeagleTermPlugin> for your JSAPI class.
///
/// Be very careful where you hold a shared_ptr to your plugin class from,
/// as it could prevent your plugin class from getting destroyed properly.
///////////////////////////////////////////////////////////////////////////////
FB::JSAPIPtr BeagleTermPlugin::createJSAPI()
{
    // m_host is the BrowserHost
    return boost::make_shared<BeagleTermPluginAPI>(FB::ptr_cast<BeagleTermPlugin>(shared_from_this()), m_host);
}

bool BeagleTermPlugin::onMouseDown(FB::MouseDownEvent *evt, FB::PluginWindow *)
{
    //printf("Mouse down at: %d, %d\n", evt->m_x, evt->m_y);
    return false;
}

bool BeagleTermPlugin::onMouseUp(FB::MouseUpEvent *evt, FB::PluginWindow *)
{
    //printf("Mouse up at: %d, %d\n", evt->m_x, evt->m_y);
    return false;
}

bool BeagleTermPlugin::onMouseMove(FB::MouseMoveEvent *evt, FB::PluginWindow *)
{
    //printf("Mouse move at: %d, %d\n", evt->m_x, evt->m_y);
    return false;
}
bool BeagleTermPlugin::onWindowAttached(FB::AttachedEvent *evt, FB::PluginWindow *)
{
    // The window is attached; act appropriately
    return false;
}

bool BeagleTermPlugin::onWindowDetached(FB::DetachedEvent *evt, FB::PluginWindow *)
{
    // The window is about to be detached; act appropriately
    return false;
}

