# Installs exofmsrt++ interface

set(namel "${PROJECT_NAME}++")

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
    COMPILE_FLAGS ${${PROJECT_NAME}_CXX_FLAGS}
    )

target_include_directories(${namel}_${buildl}
    PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
    )

target_link_libraries(${namel}_${buildl}
    ${PROJECT_NAME}::${PROJECT_NAME}f
    )

configure_file(${PROJECT_NAME}.h.in ${PROJECT_NAME}.h @ONLY)

add_library(${PROJECT_NAME}::${namel} ALIAS ${namel}_${buildl})
