# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

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

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lianqiang/lensfun-0.3.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lianqiang/lensfun-0.3.2/CMAKE

# Include any dependencies generated for this target.
include libs/lensfun/CMakeFiles/lensfun.dir/depend.make

# Include the progress variables for this target.
include libs/lensfun/CMakeFiles/lensfun.dir/progress.make

# Include the compile flags for this target's objects.
include libs/lensfun/CMakeFiles/lensfun.dir/flags.make

libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o: ../libs/lensfun/camera.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/camera.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/camera.cpp

libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/camera.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/camera.cpp > CMakeFiles/lensfun.dir/camera.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/camera.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/camera.cpp -o CMakeFiles/lensfun.dir/camera.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o: ../libs/lensfun/database.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/database.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/database.cpp

libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/database.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/database.cpp > CMakeFiles/lensfun.dir/database.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/database.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/database.cpp -o CMakeFiles/lensfun.dir/database.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o: ../libs/lensfun/lens.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/lens.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/lens.cpp

libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/lens.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/lens.cpp > CMakeFiles/lensfun.dir/lens.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/lens.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/lens.cpp -o CMakeFiles/lensfun.dir/lens.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o: ../libs/lensfun/mount.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/mount.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/mount.cpp

libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/mount.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/mount.cpp > CMakeFiles/lensfun.dir/mount.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/mount.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/mount.cpp -o CMakeFiles/lensfun.dir/mount.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o: ../libs/lensfun/cpuid.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/cpuid.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/cpuid.cpp

libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/cpuid.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/cpuid.cpp > CMakeFiles/lensfun.dir/cpuid.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/cpuid.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/cpuid.cpp -o CMakeFiles/lensfun.dir/cpuid.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o: ../libs/lensfun/mod-color-sse.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/mod-color-sse.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-color-sse.cpp

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/mod-color-sse.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-color-sse.cpp > CMakeFiles/lensfun.dir/mod-color-sse.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/mod-color-sse.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-color-sse.cpp -o CMakeFiles/lensfun.dir/mod-color-sse.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o: ../libs/lensfun/mod-color-sse2.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-color-sse2.cpp

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/mod-color-sse2.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-color-sse2.cpp > CMakeFiles/lensfun.dir/mod-color-sse2.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/mod-color-sse2.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-color-sse2.cpp -o CMakeFiles/lensfun.dir/mod-color-sse2.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o: ../libs/lensfun/mod-color.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/mod-color.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-color.cpp

libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/mod-color.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-color.cpp > CMakeFiles/lensfun.dir/mod-color.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/mod-color.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-color.cpp -o CMakeFiles/lensfun.dir/mod-color.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o: ../libs/lensfun/mod-coord-sse.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-coord-sse.cpp

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/mod-coord-sse.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-coord-sse.cpp > CMakeFiles/lensfun.dir/mod-coord-sse.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/mod-coord-sse.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-coord-sse.cpp -o CMakeFiles/lensfun.dir/mod-coord-sse.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o: ../libs/lensfun/mod-coord.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/mod-coord.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-coord.cpp

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/mod-coord.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-coord.cpp > CMakeFiles/lensfun.dir/mod-coord.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/mod-coord.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-coord.cpp -o CMakeFiles/lensfun.dir/mod-coord.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o: ../libs/lensfun/mod-subpix.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/mod-subpix.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-subpix.cpp

libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/mod-subpix.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-subpix.cpp > CMakeFiles/lensfun.dir/mod-subpix.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/mod-subpix.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/mod-subpix.cpp -o CMakeFiles/lensfun.dir/mod-subpix.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o: ../libs/lensfun/modifier.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/modifier.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/modifier.cpp

libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/modifier.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/modifier.cpp > CMakeFiles/lensfun.dir/modifier.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/modifier.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/modifier.cpp -o CMakeFiles/lensfun.dir/modifier.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o

libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o: libs/lensfun/CMakeFiles/lensfun.dir/flags.make
libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o: ../libs/lensfun/auxfun.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/lianqiang/lensfun-0.3.2/CMAKE/CMakeFiles $(CMAKE_PROGRESS_13)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lensfun.dir/auxfun.cpp.o -c /home/lianqiang/lensfun-0.3.2/libs/lensfun/auxfun.cpp

libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lensfun.dir/auxfun.cpp.i"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/lianqiang/lensfun-0.3.2/libs/lensfun/auxfun.cpp > CMakeFiles/lensfun.dir/auxfun.cpp.i

libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lensfun.dir/auxfun.cpp.s"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/lianqiang/lensfun-0.3.2/libs/lensfun/auxfun.cpp -o CMakeFiles/lensfun.dir/auxfun.cpp.s

libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o.requires:
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o.requires

libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o.provides: libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o.requires
	$(MAKE) -f libs/lensfun/CMakeFiles/lensfun.dir/build.make libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o.provides.build
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o.provides

libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o.provides.build: libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o

# Object files for target lensfun
lensfun_OBJECTS = \
"CMakeFiles/lensfun.dir/camera.cpp.o" \
"CMakeFiles/lensfun.dir/database.cpp.o" \
"CMakeFiles/lensfun.dir/lens.cpp.o" \
"CMakeFiles/lensfun.dir/mount.cpp.o" \
"CMakeFiles/lensfun.dir/cpuid.cpp.o" \
"CMakeFiles/lensfun.dir/mod-color-sse.cpp.o" \
"CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o" \
"CMakeFiles/lensfun.dir/mod-color.cpp.o" \
"CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o" \
"CMakeFiles/lensfun.dir/mod-coord.cpp.o" \
"CMakeFiles/lensfun.dir/mod-subpix.cpp.o" \
"CMakeFiles/lensfun.dir/modifier.cpp.o" \
"CMakeFiles/lensfun.dir/auxfun.cpp.o"

# External object files for target lensfun
lensfun_EXTERNAL_OBJECTS =

libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/build.make
libs/lensfun/liblensfun.so.0.3.2: libs/lensfun/CMakeFiles/lensfun.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library liblensfun.so"
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lensfun.dir/link.txt --verbose=$(VERBOSE)
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && $(CMAKE_COMMAND) -E cmake_symlink_library liblensfun.so.0.3.2 liblensfun.so.1 liblensfun.so

libs/lensfun/liblensfun.so.1: libs/lensfun/liblensfun.so.0.3.2

libs/lensfun/liblensfun.so: libs/lensfun/liblensfun.so.0.3.2

# Rule to build all files generated by this target.
libs/lensfun/CMakeFiles/lensfun.dir/build: libs/lensfun/liblensfun.so
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/build

libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/camera.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/database.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/lens.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/mount.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/cpuid.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/mod-color-sse2.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/mod-color.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/mod-coord-sse.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/mod-coord.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/mod-subpix.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/modifier.cpp.o.requires
libs/lensfun/CMakeFiles/lensfun.dir/requires: libs/lensfun/CMakeFiles/lensfun.dir/auxfun.cpp.o.requires
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/requires

libs/lensfun/CMakeFiles/lensfun.dir/clean:
	cd /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun && $(CMAKE_COMMAND) -P CMakeFiles/lensfun.dir/cmake_clean.cmake
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/clean

libs/lensfun/CMakeFiles/lensfun.dir/depend:
	cd /home/lianqiang/lensfun-0.3.2/CMAKE && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lianqiang/lensfun-0.3.2 /home/lianqiang/lensfun-0.3.2/libs/lensfun /home/lianqiang/lensfun-0.3.2/CMAKE /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun /home/lianqiang/lensfun-0.3.2/CMAKE/libs/lensfun/CMakeFiles/lensfun.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/lensfun/CMakeFiles/lensfun.dir/depend

