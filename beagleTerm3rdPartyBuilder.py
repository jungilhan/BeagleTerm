#!/usr/bin/python

import os
import sys

_TOOLCHAIN_PATH = ""
_TOOLCHAIN_PREFIX = ""

CC = "gcc"
CXX = "g++"

_OPENSSL_HOST = "http://www.openssl.org/source/"
_OPENSSL_FILE = "openssl-1.0.0e.tar.gz"
_OPENSSL_DIR = "openssl-1.0.0e"

_LIBSSH_HOST = "http://www.libssh.org/files/0.5/"
_LIBSSH_FILE = "libssh-0.5.2.tar.gz"
_LIBSSH_DIR = "libssh-0.5.2"

def exe(command):
	result = os.system(command)
	if result != 0:
		print "[ERROR] Failed to execute [" + command + "]"
		sys.exit()
		
def exit(message):
	print "[exit]", message
	sys.exit(1)	

def buildSSL():
	rootPath = os.getcwd()
	os.chdir("3rdParty")
	thirdPartyPath = os.getcwd() + "/"	

	if not os.path.exists(_OPENSSL_FILE):
		exe("wget " + _OPENSSL_HOST + _OPENSSL_FILE)
	
	exe("tar xvzf " + _OPENSSL_FILE)
	
	os.chdir(_OPENSSL_DIR)
	exe("./config no-dso no-hw no-sse2 no-krb5 no-asm shared")
	
	exe("make clean")
	exe("make")

	os.chdir(thirdPartyPath)
	libPath = "3rdPartylib" + sys.argv[1]
	if not os.path.isdir(libPath):
		exe("mkdir " + libPath)
	exe("find " + _OPENSSL_DIR + " -name *.a -exec cp -rvf {} " + libPath + " \;")
	exe("find " + _OPENSSL_DIR + " -name *.so* -exec cp -rvf {} " + libPath + " \;")
	
	os.chdir(rootPath)
	
def buildSSH():
	rootPath = os.getcwd()
	os.chdir("3rdParty")
	thirdPartyPath = os.getcwd() + "/"
	
	if not os.path.exists(_LIBSSH_FILE):
		exe("wget " + _LIBSSH_HOST + _LIBSSH_FILE)

	exe("tar xvzf " + _LIBSSH_FILE)

	os.chdir(_LIBSSH_DIR)
	if not os.path.isdir("build"):
		exe("mkdir build")
	os.chdir("build")
	
	exe("cmake -DCMAKE_C_COMPILER=" + CC + " -DCMAKE_CXX_COMPILER=" + CXX + " -DCMAKE_VERBOSE_MAKEFILE=1 -DWITH_LIBZ=OFF -DCMAKE_C_FLAGS=" + "-I" + thirdPartyPath + _OPENSSL_DIR + "/include" + " -DCMAKE_MODULE_LINKER_FLAGS=-L" + thirdPartyPath + _OPENSSL_DIR + " -DCMAKE_SHARED_LINKER_FLAGS=-L" + thirdPartyPath + _OPENSSL_DIR + " -DWITH_STATIC_LIB=ON -DOPENSSL_CRYPTO_LIBRARIES=" + thirdPartyPath + _OPENSSL_DIR + "/libcrypto.so" + " -DOPENSSL_SSL_LIBRARIES=" + thirdPartyPath + _OPENSSL_DIR + "/libssl.so" + " ..")
	
	exe("make clean")
	exe("make")	

	os.chdir(thirdPartyPath)
	libPath = "lib" + sys.argv[1]
	if not os.path.isdir(libPath):
		exe("mkdir " + libPath)
	exe("find " + _LIBSSH_DIR + " -name *.a -exec cp -rvf {} " + libPath + " \;")
	#exe("find " + _LIBSSH_DIR + " -name *.so* -exec cp -rvf {} " + libPath + " \;")
		
	os.chdir(rootPath)
	
if __name__ == '__main__':
	if len(sys.argv) != 2:
		print "[usage] ./beagleTerm3rdPartyBuilder.py 32 or 64"
		exit("unknown cpu info") 

	if sys.argv[1] == "32":
		_TOOLCHAIN_PREFIX = ""
		CC = _TOOLCHAIN_PATH + _TOOLCHAIN_PREFIX + "gcc"
		CXX = _TOOLCHAIN_PATH + _TOOLCHAIN_PREFIX + "g++"
	else:
		_TOOLCHAIN_PREFIX = ""	
		CC = _TOOLCHAIN_PATH + _TOOLCHAIN_PREFIX + "gcc"
		CXX = _TOOLCHAIN_PATH + _TOOLCHAIN_PREFIX + "g++"

	if not os.path.isdir("build"):
		os.system("mkdir 3rdParty")
	
	buildSSL()
	buildSSH()
	
	exit("Build completed")
	
	
