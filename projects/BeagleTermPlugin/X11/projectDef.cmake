#/**********************************************************\ 
# Auto-generated X11 project definition file for the
# Beagle Term Plugin project
#\**********************************************************/

# X11 template platform definition CMake file
# Included from ../CMakeLists.txt

# remember that the current source dir is the project root; this file is in X11/
file (GLOB PLATFORM RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    X11/[^.]*.cpp
    X11/[^.]*.h
    X11/[^.]*.cmake
    )

SOURCE_GROUP(X11 FILES ${PLATFORM})

# use this to add preprocessor definitions
add_definitions(
)

set (SOURCES
    ${SOURCES}
    ${PLATFORM}
    )

add_x11_plugin(${PROJECT_NAME} SOURCES)

# libssh 
set (LIBSSH_PATH ${PROJECT_SOURCE_DIR}/../../3rdParty/libssh-0.5.2)
include_directories(${LIBSSH_PATH}/include)

# openssl
set (OPENSSL_PATH ${PROJECT_SOURCE_DIR}/../../3rdParty/openssl-1.0.0e)
include_directories(${OPENSSL_PATH}/include)

# 3rd-party library for 32bit
set (LIB32_PATH ${PROJECT_SOURCE_DIR}/../../3rdParty/lib32)

# 3rd-party library for 64bit

# add library dependencies here; leave ${PLUGIN_INTERNAL_DEPS} there unless you know what you're doing!
target_link_libraries(${PROJECT_NAME}
    ${PLUGIN_INTERNAL_DEPS}
    ${LIB32_PATH}/libssh.a    
    ${LIB32_PATH}/libcrypto.a        
    ${LIB32_PATH}/libssl.a
    -lrt      
    )	
