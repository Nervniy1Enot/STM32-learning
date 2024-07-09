cmake_minimum_required(VERSION 3.0)

include(${CMAKE_SOURCE_DIR}/cmake/arm_none_eabi.cmake)

project(FIRST)

enable_language(C ASM)
set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(EXECUTABLE ${PROJECT_NAME}.elf)

add_subdirectory(${CMAKE_SOURCE_DIR}/drivers/CMSIS)

add_executable(${EXECUTABLE}
    ${CMAKE_SOURCE_DIR}/main.cpp
    ${CMAKE_SOURCE_DIR}/startup_stm32f100rbtx.s
)

target_link_libraries(${EXECUTABLE} cmsis)

target_link_options(${EXECUTABLE} PRIVATE
    -T${CMAKE_SOURCE_DIR}/STM32F100RBTX_FLASH.ld
    -mcpu=cortex-m3

    -mthumb
    -mfpu=fpv4-sp-d16
    #-mfloat-abi=hard

    -specs=nano.specs

    -lc
    -lm
    -lnosys

    -Wl,-Map=${PROJECT_NAME}.map,--cref
    -Wl,--gc-sections
    -Wl,--print-memory-usage
)

target_compile_options(${EXECUTABLE} PRIVATE
    -mcpu=cortex-m3

    -mthumb
    -mfpu=fpv4-sp-d16
    #-mfloat-abi=hard

    -DSTM32F1
    -DSTM32F100RBTX

    -fdata-sections
    -ffunction-sections

    -Wall

    -O
    -g
)

add_custom_command(TARGET ${EXECUTABLE}
    POST_BUILD
    COMMAND arm-none-eabi-size ${EXECUTABLE}
)

# Create hex file
add_custom_command(TARGET ${EXECUTABLE}
    POST_BUILD
    COMMAND arm-none-eabi-objcopy -Oihex ${EXECUTABLE} ${PROJECT_NAME}.hex
    COMMAND arm-none-eabi-objcopy -Obinary ${EXECUTABLE} ${PROJECT_NAME}.bin
    COMMAND arm-none-eabi-objdump -h -S -z ${EXECUTABLE} > ${PROJECT_NAME}.lssz
    COMMAND arm-none-eabi-objdump -h -d ${EXECUTABLE} > ${PROJECT_NAME}.lss
    COMMAND
)