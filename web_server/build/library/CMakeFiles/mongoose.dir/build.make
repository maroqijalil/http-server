# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/maroqi/Documents/ICHIRO2020/httpd/web_server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build

# Include any dependencies generated for this target.
include library/CMakeFiles/mongoose.dir/depend.make

# Include the progress variables for this target.
include library/CMakeFiles/mongoose.dir/progress.make

# Include the compile flags for this target's objects.
include library/CMakeFiles/mongoose.dir/flags.make

library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o: library/CMakeFiles/mongoose.dir/flags.make
library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o: ../library/mongoose/src/mongoose.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o"
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/library && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o   -c /home/maroqi/Documents/ICHIRO2020/httpd/web_server/library/mongoose/src/mongoose.c

library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.i"
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/library && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/maroqi/Documents/ICHIRO2020/httpd/web_server/library/mongoose/src/mongoose.c > CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.i

library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.s"
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/library && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/maroqi/Documents/ICHIRO2020/httpd/web_server/library/mongoose/src/mongoose.c -o CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.s

library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o.requires:

.PHONY : library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o.requires

library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o.provides: library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o.requires
	$(MAKE) -f library/CMakeFiles/mongoose.dir/build.make library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o.provides.build
.PHONY : library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o.provides

library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o.provides.build: library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o


# Object files for target mongoose
mongoose_OBJECTS = \
"CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o"

# External object files for target mongoose
mongoose_EXTERNAL_OBJECTS =

library/libmongoose.a: library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o
library/libmongoose.a: library/CMakeFiles/mongoose.dir/build.make
library/libmongoose.a: library/CMakeFiles/mongoose.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libmongoose.a"
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/library && $(CMAKE_COMMAND) -P CMakeFiles/mongoose.dir/cmake_clean_target.cmake
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/library && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mongoose.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
library/CMakeFiles/mongoose.dir/build: library/libmongoose.a

.PHONY : library/CMakeFiles/mongoose.dir/build

library/CMakeFiles/mongoose.dir/requires: library/CMakeFiles/mongoose.dir/mongoose/src/mongoose.c.o.requires

.PHONY : library/CMakeFiles/mongoose.dir/requires

library/CMakeFiles/mongoose.dir/clean:
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/library && $(CMAKE_COMMAND) -P CMakeFiles/mongoose.dir/cmake_clean.cmake
.PHONY : library/CMakeFiles/mongoose.dir/clean

library/CMakeFiles/mongoose.dir/depend:
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/maroqi/Documents/ICHIRO2020/httpd/web_server /home/maroqi/Documents/ICHIRO2020/httpd/web_server/library /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/library /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/library/CMakeFiles/mongoose.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : library/CMakeFiles/mongoose.dir/depend
