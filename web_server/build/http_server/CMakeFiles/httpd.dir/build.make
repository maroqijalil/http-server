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
include http_server/CMakeFiles/httpd.dir/depend.make

# Include the progress variables for this target.
include http_server/CMakeFiles/httpd.dir/progress.make

# Include the compile flags for this target's objects.
include http_server/CMakeFiles/httpd.dir/flags.make

http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o: http_server/CMakeFiles/httpd.dir/flags.make
http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o: ../http_server/src/httpd_mongoose/simplest_web_server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o"
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/http_server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o -c /home/maroqi/Documents/ICHIRO2020/httpd/web_server/http_server/src/httpd_mongoose/simplest_web_server.cpp

http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.i"
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/http_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/maroqi/Documents/ICHIRO2020/httpd/web_server/http_server/src/httpd_mongoose/simplest_web_server.cpp > CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.i

http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.s"
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/http_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/maroqi/Documents/ICHIRO2020/httpd/web_server/http_server/src/httpd_mongoose/simplest_web_server.cpp -o CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.s

http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o.requires:

.PHONY : http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o.requires

http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o.provides: http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o.requires
	$(MAKE) -f http_server/CMakeFiles/httpd.dir/build.make http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o.provides.build
.PHONY : http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o.provides

http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o.provides.build: http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o


# Object files for target httpd
httpd_OBJECTS = \
"CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o"

# External object files for target httpd
httpd_EXTERNAL_OBJECTS =

http_server/httpd: http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o
http_server/httpd: http_server/CMakeFiles/httpd.dir/build.make
http_server/httpd: library/libmongoose.a
http_server/httpd: http_server/CMakeFiles/httpd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable httpd"
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/http_server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/httpd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
http_server/CMakeFiles/httpd.dir/build: http_server/httpd

.PHONY : http_server/CMakeFiles/httpd.dir/build

http_server/CMakeFiles/httpd.dir/requires: http_server/CMakeFiles/httpd.dir/src/httpd_mongoose/simplest_web_server.cpp.o.requires

.PHONY : http_server/CMakeFiles/httpd.dir/requires

http_server/CMakeFiles/httpd.dir/clean:
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/http_server && $(CMAKE_COMMAND) -P CMakeFiles/httpd.dir/cmake_clean.cmake
.PHONY : http_server/CMakeFiles/httpd.dir/clean

http_server/CMakeFiles/httpd.dir/depend:
	cd /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/maroqi/Documents/ICHIRO2020/httpd/web_server /home/maroqi/Documents/ICHIRO2020/httpd/web_server/http_server /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/http_server /home/maroqi/Documents/ICHIRO2020/httpd/web_server/build/http_server/CMakeFiles/httpd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : http_server/CMakeFiles/httpd.dir/depend

