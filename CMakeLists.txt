# This package generates the following targets:
#   
#   exofmsrtf: libexofmsrt_debug.a or libexofmsrtf_release.a
#   exofmsrt++: OBJECT library
#
# Usage:
#
#   include_directories(${MINICHEM_INCLUDE_DIR})
#   target_link_libraries(exofmsrt::exofmsrtf exofmsrt::exofmsrt++)

cmake_minimum_required(VERSION 3.18)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(
  exofmsrt
  LANGUAGES CXX Fortran
  DESCRIPTION "C++ interface to the ExoFMS-CK library"
  )

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
  message(STATUS "Default Build Type = Release")
  message(STATUS "")
else()
  message(STATUS "Build Type = ${CMAKE_BUILD_TYPE}")
  message(STATUS "")
endif()

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules/)

## 1. set up compiler flags ##
message(STATUS "1. Set up project compiler flags ...")
message(STATUS "Include ${CMAKE_CURRENT_SOURCE_DIR}/cmake/compilers.cmake")
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/compilers.cmake)

## 2. set up project source codes ##
message(STATUS "2. Set up source codes ...")
add_subdirectory(src)
add_subdirectory(interface)

string(TOUPPER ${PROJECT_NAME} project)
set(${project}_INCLUDE_DIR 
  "${CMAKE_CURRENT_SOURCE_DIR}"
  CACHE PATH "Path to project include directory")

message(STATUS "3. Set up unit tests ...")
add_subdirectory(tests)
