# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build

# Utility rule file for doxygen-trac.

doc/CMakeFiles/doxygen-trac:
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/doc && /usr/bin/doxygen /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/doc/doxy.trac

doxygen-trac: doc/CMakeFiles/doxygen-trac
doxygen-trac: doc/CMakeFiles/doxygen-trac.dir/build.make
.PHONY : doxygen-trac

# Rule to build all files generated by this target.
doc/CMakeFiles/doxygen-trac.dir/build: doxygen-trac
.PHONY : doc/CMakeFiles/doxygen-trac.dir/build

doc/CMakeFiles/doxygen-trac.dir/clean:
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/doc && $(CMAKE_COMMAND) -P CMakeFiles/doxygen-trac.dir/cmake_clean.cmake
.PHONY : doc/CMakeFiles/doxygen-trac.dir/clean

doc/CMakeFiles/doxygen-trac.dir/depend:
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2 /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/doc /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/doc /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/doc/CMakeFiles/doxygen-trac.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/CMakeFiles/doxygen-trac.dir/depend

