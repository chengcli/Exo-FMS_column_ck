# Setup for GCC compiler:
#
if(CMAKE_Fortran_COMPILER_ID MATCHES "GNU")
  if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(EXOFMSRT_Fortran_FLAGS "-g3 -std=legacy"
      CACHE INTERNAL "EXOFMSRT Fortran compiler flags")
  elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(EXOFMSRT_Fortran_FLAGS "-O3 -pipe -std=legacy"
      CACHE INTERNAL "EXOFMSRT Fortran compiler flags")
  else()
    message(FATAL_ERROR "Unknown build type: ${CMAKE_BUILD_TYPE}")
  endif()

  set(F2C_FEXPAND1 "fname ## _"
    CACHE INTERNAL "Fortran name mangling macro 1")
  set(F2C_FEXPAND2 "__ ## mname ## _MOD_ ## fname"
    CACHE INTERNAL "Fortran name mangling macro")

  set(KNOWN_FORTRAN_COMPILER TRUE)
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
  if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(EXOFMSRT_CXX_FLAGS "-g3"
      CACHE INTERNAL "EXOFMSRT CXX compiler flags")
  elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(EXOFMSRT_CXX_FLAGS "-O3"
      CACHE INTERNAL "EXOFMSRT CXX compiler flags")
  else()
    message(FATAL_ERROR "Unknown build type: ${CMAKE_BUILD_TYPE}")
  endif()

  set(KNOWN_CXX_COMPILER TRUE)
endif()

# Setup for Clang compiler:
#
if (CMAKE_Fortran_COMPILER_ID MATCHES "Clang" )
  if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(EXOFMSRT_Fortran_FLAGS "-g3"
      CACHE INTERNAL "EXOFMSRT Fortran compiler flags")
  elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(EXOFMSRT_Fortran_FLAGS "-O3 -pipe"
      CACHE INTERNAL "EXOFMSRT Fortran compiler flags")
  else()
    message(FATAL_ERROR "Unknown build type: ${CMAKE_BUILD_TYPE}")
  endif()

  set(KNOWN_FORTRAN_COMPILER TRUE)
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(EXOFMSRT_CXX_FLAGS "-g3"
      CACHE INTERNAL "EXOFMSRT CXX compiler flags")
  elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(EXOFMSRT_CXX_FLAGS "-O3"
      CACHE INTERNAL "EXOFMSRT CXX compiler flags")
  else()
    message(FATAL_ERROR "Unknown build type: ${CMAKE_BUILD_TYPE}")
  endif()

  set(KNOWN_CXX_COMPILER TRUE)
endif()

# Setup for ICC compiler:
#
if(CMAKE_Fortran_COMPILER_ID MATCHES "Intel")
  if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(EXOFMSRT_Fortran_FLAGS "-g3 -stand f95"
      CACHE INTERNAL "EXOFMSRT Fortran compiler flags")
  elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(EXOFMSRT_Fortran_FLAGS "-O3 -pipe -stand f95"
      CACHE INTERNAL "EXOFMSRT Fortran compiler flags")
  else()
    message(FATAL_ERROR "Unknown build type: ${CMAKE_BUILD_TYPE}")
  endif()

  set(F2C_FEXPAND1 "fname ## _"
    CACHE INTERNAL "Fortran name mangling macro 1")
  set(F2c_FEXPAND2 "mname ## _mp_ ## fname ## _"
    CACHE INTERNAL "Fortran name mangling macro")

  set(KNOWN_FORTRAN_COMPILER TRUE)
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "Intel")
  if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(EXOFMSRT_CXX_FLAGS "-g3"
      CACHE INTERNAL "EXOFMSRT CXX compiler flags")
  elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(EXOFMSRT_CXX_FLAGS "-O3"
      CACHE INTERNAL "EXOFMSRT CXX compiler flags")
  else()
    message(FATAL_ERROR "Unknown build type: ${CMAKE_BUILD_TYPE}")
  endif()

  set(KNOWN_CXX_COMPILER TRUE)
endif()

if (NOT KNOWN_FORTRAN_COMPILER)
  message(FATAL_ERROR "\nUnknown Fortran compiler!\n")
endif()

if (NOT KNOWN_CXX_COMPILER)
  message(FATAL_ERROR "\nUnknown C++ compiler!\n")
endif()
