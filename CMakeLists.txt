# This package generates the following targets:
#   
#   exofmsrtf: libexofmsrt_debug.a or libexofmsrtf_release.a
#   exofmsrt++: OBJECT library
#
# Usage:
#
#   include_directories(${EXOFMSRT_INCLUDE_DIR})
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

string(ASCII 27 Esc)
set(ColorReset "${Esc}[m")
set(Green      "${Esc}[32m")

message(STATUS "")
message(STATUS "${Green}==== ${PROJECT_NAME} configure begin ====${ColorReset}")

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
  message(STATUS "Build Type = Release")
else()
  message(STATUS "Build Type = ${CMAKE_BUILD_TYPE}")
endif()

# load all modules
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules/)

# load all macros
file(GLOB _macro_files "${CMAKE_CURRENT_SOURCE_DIR}/cmake/macros/*.cmake")
foreach(_file ${_macro_files})
  include(${_file})
endforeach()

## 1. set up compiler flags ##
message(STATUS "${PROJECT_NAME}-1. Setting up project compiler flags ...")
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/compilers.cmake)
string(TOUPPER ${PROJECT_NAME} projectu)
message(STATUS "Fortran flags: ${${projectu}_Fortran_FLAGS}")
message(STATUS "C++ flags: ${${projectu}_CXX_FLAGS}")

## 2. set up project source codes ##
message(STATUS "${PROJECT_NAME}-2. Setting up source codes ...")
add_subdirectory(src)
add_subdirectory(interface)

set(${projectu}_INCLUDE_DIR 
  "${CMAKE_CURRENT_SOURCE_DIR}"
  CACHE PATH "Path to project include directory")
message(STATUS "Include directory: ${${projectu}_INCLUDE_DIR}")

## 3. set up project unit tests ##
message(STATUS "${PROJECT_NAME}-3. Setting up unit tests ...")
add_subdirectory(tests)

message(STATUS "${Green}==== ${PROJECT_NAME} configure done ====${ColorReset}")
message(STATUS "")
