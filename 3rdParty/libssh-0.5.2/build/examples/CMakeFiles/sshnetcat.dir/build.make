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
include examples/CMakeFiles/sshnetcat.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/sshnetcat.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/sshnetcat.dir/flags.make

examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o: examples/CMakeFiles/sshnetcat.dir/flags.make
examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o: ../examples/sshnetcat.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sshnetcat.dir/sshnetcat.c.o   -c /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/sshnetcat.c

examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sshnetcat.dir/sshnetcat.c.i"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/sshnetcat.c > CMakeFiles/sshnetcat.dir/sshnetcat.c.i

examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sshnetcat.dir/sshnetcat.c.s"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/sshnetcat.c -o CMakeFiles/sshnetcat.dir/sshnetcat.c.s

examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o.requires:
.PHONY : examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o.requires

examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o.provides: examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o.requires
	$(MAKE) -f examples/CMakeFiles/sshnetcat.dir/build.make examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o.provides.build
.PHONY : examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o.provides

examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o.provides.build: examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o
.PHONY : examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o.provides.build

examples/CMakeFiles/sshnetcat.dir/authentication.c.o: examples/CMakeFiles/sshnetcat.dir/flags.make
examples/CMakeFiles/sshnetcat.dir/authentication.c.o: ../examples/authentication.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/CMakeFiles/sshnetcat.dir/authentication.c.o"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sshnetcat.dir/authentication.c.o   -c /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/authentication.c

examples/CMakeFiles/sshnetcat.dir/authentication.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sshnetcat.dir/authentication.c.i"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/authentication.c > CMakeFiles/sshnetcat.dir/authentication.c.i

examples/CMakeFiles/sshnetcat.dir/authentication.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sshnetcat.dir/authentication.c.s"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/authentication.c -o CMakeFiles/sshnetcat.dir/authentication.c.s

examples/CMakeFiles/sshnetcat.dir/authentication.c.o.requires:
.PHONY : examples/CMakeFiles/sshnetcat.dir/authentication.c.o.requires

examples/CMakeFiles/sshnetcat.dir/authentication.c.o.provides: examples/CMakeFiles/sshnetcat.dir/authentication.c.o.requires
	$(MAKE) -f examples/CMakeFiles/sshnetcat.dir/build.make examples/CMakeFiles/sshnetcat.dir/authentication.c.o.provides.build
.PHONY : examples/CMakeFiles/sshnetcat.dir/authentication.c.o.provides

examples/CMakeFiles/sshnetcat.dir/authentication.c.o.provides.build: examples/CMakeFiles/sshnetcat.dir/authentication.c.o
.PHONY : examples/CMakeFiles/sshnetcat.dir/authentication.c.o.provides.build

examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o: examples/CMakeFiles/sshnetcat.dir/flags.make
examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o: ../examples/knownhosts.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sshnetcat.dir/knownhosts.c.o   -c /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/knownhosts.c

examples/CMakeFiles/sshnetcat.dir/knownhosts.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sshnetcat.dir/knownhosts.c.i"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/knownhosts.c > CMakeFiles/sshnetcat.dir/knownhosts.c.i

examples/CMakeFiles/sshnetcat.dir/knownhosts.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sshnetcat.dir/knownhosts.c.s"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/knownhosts.c -o CMakeFiles/sshnetcat.dir/knownhosts.c.s

examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o.requires:
.PHONY : examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o.requires

examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o.provides: examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o.requires
	$(MAKE) -f examples/CMakeFiles/sshnetcat.dir/build.make examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o.provides.build
.PHONY : examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o.provides

examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o.provides.build: examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o
.PHONY : examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o.provides.build

examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o: examples/CMakeFiles/sshnetcat.dir/flags.make
examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o: ../examples/connect_ssh.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sshnetcat.dir/connect_ssh.c.o   -c /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/connect_ssh.c

examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sshnetcat.dir/connect_ssh.c.i"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/connect_ssh.c > CMakeFiles/sshnetcat.dir/connect_ssh.c.i

examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sshnetcat.dir/connect_ssh.c.s"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples/connect_ssh.c -o CMakeFiles/sshnetcat.dir/connect_ssh.c.s

examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o.requires:
.PHONY : examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o.requires

examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o.provides: examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o.requires
	$(MAKE) -f examples/CMakeFiles/sshnetcat.dir/build.make examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o.provides.build
.PHONY : examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o.provides

examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o.provides.build: examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o
.PHONY : examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o.provides.build

# Object files for target sshnetcat
sshnetcat_OBJECTS = \
"CMakeFiles/sshnetcat.dir/sshnetcat.c.o" \
"CMakeFiles/sshnetcat.dir/authentication.c.o" \
"CMakeFiles/sshnetcat.dir/knownhosts.c.o" \
"CMakeFiles/sshnetcat.dir/connect_ssh.c.o"

# External object files for target sshnetcat
sshnetcat_EXTERNAL_OBJECTS =

examples/sshnetcat: examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o
examples/sshnetcat: examples/CMakeFiles/sshnetcat.dir/authentication.c.o
examples/sshnetcat: examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o
examples/sshnetcat: examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o
examples/sshnetcat: src/libssh.so.4.2.2
examples/sshnetcat: /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/openssl-1.0.0e/libssl.so
examples/sshnetcat: /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/openssl-1.0.0e/libcrypto.so
examples/sshnetcat: examples/CMakeFiles/sshnetcat.dir/build.make
examples/sshnetcat: examples/CMakeFiles/sshnetcat.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable sshnetcat"
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sshnetcat.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/sshnetcat.dir/build: examples/sshnetcat
.PHONY : examples/CMakeFiles/sshnetcat.dir/build

examples/CMakeFiles/sshnetcat.dir/requires: examples/CMakeFiles/sshnetcat.dir/sshnetcat.c.o.requires
examples/CMakeFiles/sshnetcat.dir/requires: examples/CMakeFiles/sshnetcat.dir/authentication.c.o.requires
examples/CMakeFiles/sshnetcat.dir/requires: examples/CMakeFiles/sshnetcat.dir/knownhosts.c.o.requires
examples/CMakeFiles/sshnetcat.dir/requires: examples/CMakeFiles/sshnetcat.dir/connect_ssh.c.o.requires
.PHONY : examples/CMakeFiles/sshnetcat.dir/requires

examples/CMakeFiles/sshnetcat.dir/clean:
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/sshnetcat.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/sshnetcat.dir/clean

examples/CMakeFiles/sshnetcat.dir/depend:
	cd /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2 /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/examples /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples /home/jihan/Workspace/MonkeyLabs/BeagleTerm/3rdParty/libssh-0.5.2/build/examples/CMakeFiles/sshnetcat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/sshnetcat.dir/depend

