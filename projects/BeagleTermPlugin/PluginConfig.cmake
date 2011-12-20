#/**********************************************************\ 
#
# Auto-Generated Plugin Configuration file
# for Beagle Term Plugin
#
#\**********************************************************/

set(PLUGIN_NAME "BeagleTermPlugin")
set(PLUGIN_PREFIX "BTP")
set(COMPANY_NAME "BeagleTerm")

# ActiveX constants:
set(FBTYPELIB_NAME BeagleTermPluginLib)
set(FBTYPELIB_DESC "BeagleTermPlugin 1.0 Type Library")
set(IFBControl_DESC "BeagleTermPlugin Control Interface")
set(FBControl_DESC "BeagleTermPlugin Control Class")
set(IFBComJavascriptObject_DESC "BeagleTermPlugin IComJavascriptObject Interface")
set(FBComJavascriptObject_DESC "BeagleTermPlugin ComJavascriptObject Class")
set(IFBComEventSource_DESC "BeagleTermPlugin IFBComEventSource Interface")
set(AXVERSION_NUM "1")

# NOTE: THESE GUIDS *MUST* BE UNIQUE TO YOUR PLUGIN/ACTIVEX CONTROL!  YES, ALL OF THEM!
set(FBTYPELIB_GUID f3ce7926-8129-5ee5-9d98-f333080d4a32)
set(IFBControl_GUID e4e70491-1f4c-5591-9d3f-c34b1b5b3443)
set(FBControl_GUID d655bd62-630d-5993-9ab6-62b6f7b355d7)
set(IFBComJavascriptObject_GUID 234b4b5f-71ed-5a62-a185-a357405dd507)
set(FBComJavascriptObject_GUID 01857334-fc8b-5747-b268-a6cdbd1b7844)
set(IFBComEventSource_GUID 0b8344f7-5527-5fb6-bf37-ff26d0872b60)

# these are the pieces that are relevant to using it from Javascript
set(ACTIVEX_PROGID "BeagleTerm.BeagleTermPlugin")
set(MOZILLA_PLUGINID "jungilhan.github.com/BeagleTermPlugin")

# strings
set(FBSTRING_CompanyName "Beagle Term")
set(FBSTRING_FileDescription "SSH plugin for beagle term")
set(FBSTRING_PLUGIN_VERSION "1.0.0.0")
set(FBSTRING_LegalCopyright "Copyright 2011 Beagle Term")
set(FBSTRING_PluginFileName "np${PLUGIN_NAME}.dll")
set(FBSTRING_ProductName "Beagle Term Plugin")
set(FBSTRING_FileExtents "")
set(FBSTRING_PluginName "Beagle Term Plugin")
set(FBSTRING_MIMEType "application/x-beagletermplugin")

# Uncomment this next line if you're not planning on your plugin doing
# any drawing:

set (FB_GUI_DISABLED 1)

# Mac plugin settings. If your plugin does not draw, set these all to 0
set(FBMAC_USE_QUICKDRAW 0)
set(FBMAC_USE_CARBON 1)
set(FBMAC_USE_COCOA 1)
set(FBMAC_USE_COREGRAPHICS 1)
set(FBMAC_USE_COREANIMATION 0)
set(FBMAC_USE_INVALIDATINGCOREANIMATION 0)

# If you want to register per-machine on Windows, uncomment this line
#set (FB_ATLREG_MACHINEWIDE 1)
