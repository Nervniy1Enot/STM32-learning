cmake_minimum_required(VERSION 3.0)

project(cmsis C)

set(HEADER_LIST
    ${CMAKE_CURRENT_SOURCE_DIR}/DeviceSupport/ST/STM32F10x/stm32f10x.h
    ${CMAKE_CURRENT_SOURCE_DIR}/DeviceSupport/ST/STM32F10x/system_stm32f10x.h
    ${CMAKE_CURRENT_SOURCE_DIR}/CoreSupport/core_cm3.h
)

set(SOURCE_LIST
    ${CMAKE_CURRENT_SOURCE_DIR}/DeviceSupport/ST/STM32F10x/system_stm32f10x.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CoreSupport/core_cm3.c
)

add_library(${PROJECT_NAME} OBJECT
    ${SOURCE_LIST}
    ${HEADER_LIST}
)

target_compile_options(${PROJECT_NAME} PRIVATE
    -mcpu=cortex-m3
)

target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/DeviceSupport/ST/STM32F10x
    ${CMAKE_CURRENT_SOURCE_DIR}/CoreSupport
)