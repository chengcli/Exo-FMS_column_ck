# Compile exofmsrt++ interface
message(STATUS "Compile the exofmsrt interface code")

set(namel "exofmsrt++")

file(GLOB src_files
    *.cpp
    )

string(TOLOWER ${CMAKE_BUILD_TYPE} buildl)

add_library(${namel}_${buildl}
    OBJECT
    ${src_files}
    )

set_target_properties(${namel}_${buildl}
    PROPERTIES
    COMPILE_FLAGS ${EXOFMSRT_CXX_FLAGS}
    )

target_include_directories(${namel}_${buildl}
    PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
    )

target_link_libraries(${namel}_${buildl}
    exofmsrt::exofmsrtf
    )

configure_file(exofmsrt.h.in exofmsrt.h @ONLY)

add_library(exofmsrt::${namel} ALIAS ${namel}_${buildl})
