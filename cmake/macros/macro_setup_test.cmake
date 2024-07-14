# set up test case
macro(setup_test namel)
  string(TOLOWER ${CMAKE_BUILD_TYPE} buildl)

  add_executable(${namel}.${buildl} ${namel}.cpp)

  set_target_properties(${namel}.${buildl}
                        PROPERTIES 
                        COMPILE_FLAGS ${EXOFMSRT_CXX_FLAGS})

  target_include_directories(${namel}.${buildl}
                             PRIVATE ${EXOFMSRT_INCLUDE_DIR})

  target_link_libraries(${namel}.${buildl}
                        exofmsrt::exofmsrt++
                        )
  add_test(NAME ${namel}.${buildl} COMMAND ${namel}.${buildl})
endmacro()
