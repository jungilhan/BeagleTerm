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

# Include any dependencies generated for this target.
include examples/CMakeFiles/samplesshd.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/samplesshd.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/samplesshd.dir/flags.make

examples/CMakeFiles/samplesshd.dir/samplesshd.c.o: examples/CMakeFiles/samplesshd.dir/flags.make
examples/CMakeFiles/samplesshd.dir/samplesshd.c.o: ../examples/samplesshd.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/CMakeFiles/samplesshd.dir/samplesshd.c.o"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/samplesshd.dir/samplesshd.c.o   -c /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/samplesshd.c

examples/CMakeFiles/samplesshd.dir/samplesshd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/samplesshd.dir/samplesshd.c.i"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/samplesshd.c > CMakeFiles/samplesshd.dir/samplesshd.c.i

examples/CMakeFiles/samplesshd.dir/samplesshd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/samplesshd.dir/samplesshd.c.s"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/samplesshd.c -o CMakeFiles/samplesshd.dir/samplesshd.c.s

examples/CMakeFiles/samplesshd.dir/samplesshd.c.o.requires:
.PHONY : examples/CMakeFiles/samplesshd.dir/samplesshd.c.o.requires

examples/CMakeFiles/samplesshd.dir/samplesshd.c.o.provides: examples/CMakeFiles/samplesshd.dir/samplesshd.c.o.requires
	$(MAKE) -f examples/CMakeFiles/samplesshd.dir/build.make examples/CMakeFiles/samplesshd.dir/samplesshd.c.o.provides.build
.PHONY : examples/CMakeFiles/samplesshd.dir/samplesshd.c.o.provides

examples/CMakeFiles/samplesshd.dir/samplesshd.c.o.provides.build: examples/CMakeFiles/samplesshd.dir/samplesshd.c.o
.PHONY : examples/CMakeFiles/samplesshd.dir/samplesshd.c.o.provides.build

# Object files for target samplesshd
samplesshd_OBJECTS = \
"CMakeFiles/samplesshd.dir/samplesshd.c.o"

# External object files for target samplesshd
samplesshd_EXTERNAL_OBJECTS =

examples/samplesshd: examples/CMakeFiles/samplesshd.dir/samplesshd.c.o
examples/samplesshd: src/libssh.so.4.2.2
examples/samplesshd: /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/openssl-1.0.0e/libssl.so
examples/samplesshd: /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/openssl-1.0.0e/libcrypto.so
examples/samplesshd: examples/CMakeFiles/samplesshd.dir/build.make
examples/samplesshd: examples/CMakeFiles/samplesshd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable samplesshd"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/samplesshd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/samplesshd.dir/build: examples/samplesshd
.PHONY : examples/CMakeFiles/samplesshd.dir/build

examples/CMakeFiles/samplesshd.dir/requires: examples/CMakeFiles/samplesshd.dir/samplesshd.c.o.requires
.PHONY : examples/CMakeFiles/samplesshd.dir/requires

examples/CMakeFiles/samplesshd.dir/clean:
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/samplesshd.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/samplesshd.dir/clean

examples/CMakeFiles/samplesshd.dir/depend:
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2 /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples/CMakeFiles/samplesshd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/samplesshd.dir/depend

