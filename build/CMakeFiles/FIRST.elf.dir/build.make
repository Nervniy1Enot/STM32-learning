# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = E:\cmake-3.28.3-windows-x86_64\bin\cmake.exe

# The command to remove a file.
RM = E:\cmake-3.28.3-windows-x86_64\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:\proj\test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:\proj\test\build

# Include any dependencies generated for this target.
include CMakeFiles/FIRST.elf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/FIRST.elf.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/FIRST.elf.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/FIRST.elf.dir/flags.make

CMakeFiles/FIRST.elf.dir/main.cpp.obj: CMakeFiles/FIRST.elf.dir/flags.make
CMakeFiles/FIRST.elf.dir/main.cpp.obj: E:/proj/test/main.cpp
CMakeFiles/FIRST.elf.dir/main.cpp.obj: CMakeFiles/FIRST.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=E:\proj\test\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/FIRST.elf.dir/main.cpp.obj"
	"E:\Program Files\msys64\mingw64\bin\arm-none-eabi-g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/FIRST.elf.dir/main.cpp.obj -MF CMakeFiles\FIRST.elf.dir\main.cpp.obj.d -o CMakeFiles\FIRST.elf.dir\main.cpp.obj -c E:\proj\test\main.cpp

CMakeFiles/FIRST.elf.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/FIRST.elf.dir/main.cpp.i"
	"E:\Program Files\msys64\mingw64\bin\arm-none-eabi-g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E E:\proj\test\main.cpp > CMakeFiles\FIRST.elf.dir\main.cpp.i

CMakeFiles/FIRST.elf.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/FIRST.elf.dir/main.cpp.s"
	"E:\Program Files\msys64\mingw64\bin\arm-none-eabi-g++.exe" $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S E:\proj\test\main.cpp -o CMakeFiles\FIRST.elf.dir\main.cpp.s

CMakeFiles/FIRST.elf.dir/startup_stm32f100rbtx.s.obj: CMakeFiles/FIRST.elf.dir/flags.make
CMakeFiles/FIRST.elf.dir/startup_stm32f100rbtx.s.obj: E:/proj/test/startup_stm32f100rbtx.s
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=E:\proj\test\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building ASM object CMakeFiles/FIRST.elf.dir/startup_stm32f100rbtx.s.obj"
	"E:\Program Files\msys64\mingw64\bin\arm-none-eabi-gcc.exe" $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles\FIRST.elf.dir\startup_stm32f100rbtx.s.obj -c E:\proj\test\startup_stm32f100rbtx.s

CMakeFiles/FIRST.elf.dir/startup_stm32f100rbtx.s.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing ASM source to CMakeFiles/FIRST.elf.dir/startup_stm32f100rbtx.s.i"
	"E:\Program Files\msys64\mingw64\bin\arm-none-eabi-gcc.exe" $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E E:\proj\test\startup_stm32f100rbtx.s > CMakeFiles\FIRST.elf.dir\startup_stm32f100rbtx.s.i

CMakeFiles/FIRST.elf.dir/startup_stm32f100rbtx.s.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling ASM source to assembly CMakeFiles/FIRST.elf.dir/startup_stm32f100rbtx.s.s"
	"E:\Program Files\msys64\mingw64\bin\arm-none-eabi-gcc.exe" $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S E:\proj\test\startup_stm32f100rbtx.s -o CMakeFiles\FIRST.elf.dir\startup_stm32f100rbtx.s.s

# Object files for target FIRST.elf
FIRST_elf_OBJECTS = \
"CMakeFiles/FIRST.elf.dir/main.cpp.obj" \
"CMakeFiles/FIRST.elf.dir/startup_stm32f100rbtx.s.obj"

# External object files for target FIRST.elf
FIRST_elf_EXTERNAL_OBJECTS = \
"E:/proj/test/build/drivers/CMSIS/CMakeFiles/cmsis.dir/DeviceSupport/ST/STM32F10x/system_stm32f10x.c.obj" \
"E:/proj/test/build/drivers/CMSIS/CMakeFiles/cmsis.dir/CoreSupport/core_cm3.c.obj"

FIRST.elf: CMakeFiles/FIRST.elf.dir/main.cpp.obj
FIRST.elf: CMakeFiles/FIRST.elf.dir/startup_stm32f100rbtx.s.obj
FIRST.elf: drivers/CMSIS/CMakeFiles/cmsis.dir/DeviceSupport/ST/STM32F10x/system_stm32f10x.c.obj
FIRST.elf: drivers/CMSIS/CMakeFiles/cmsis.dir/CoreSupport/core_cm3.c.obj
FIRST.elf: CMakeFiles/FIRST.elf.dir/build.make
FIRST.elf: CMakeFiles/FIRST.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=E:\proj\test\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable FIRST.elf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\FIRST.elf.dir\link.txt --verbose=$(VERBOSE)
	arm-none-eabi-size FIRST.elf
	arm-none-eabi-objcopy -Oihex FIRST.elf FIRST.hex
	arm-none-eabi-objcopy -Obinary FIRST.elf FIRST.bin

# Rule to build all files generated by this target.
CMakeFiles/FIRST.elf.dir/build: FIRST.elf
.PHONY : CMakeFiles/FIRST.elf.dir/build

CMakeFiles/FIRST.elf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\FIRST.elf.dir\cmake_clean.cmake
.PHONY : CMakeFiles/FIRST.elf.dir/clean

CMakeFiles/FIRST.elf.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\proj\test E:\proj\test E:\proj\test\build E:\proj\test\build E:\proj\test\build\CMakeFiles\FIRST.elf.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/FIRST.elf.dir/depend
