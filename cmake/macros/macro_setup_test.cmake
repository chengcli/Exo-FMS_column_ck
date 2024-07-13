# set up test case
macro(setup_test namel)
  string(TOLOWER ${CMAKE_BUILD_TYPE} buildl)

  add_executable(${namel}.${buildl} ${namel}.cpp)

  set_target_properties(${namel}.${buildl}
                        PROPERTIES 
                        COMPILE_FLAGS ${${PROJECT_NAME}_CXX_FLAGS})

  string(TOUPPER ${PROJECT_NAME} projectu)
  target_include_directories(${namel}.${buildl}
                             PRIVATE ${${projectu}_INCLUDE_DIR})

  target_link_libraries(${namel}.${buildl}
                        ${PROJECT_NAME}::${PROJECT_NAME}++
                        )
  add_test(NAME ${namel}.${buildl} COMMAND ${namel}.${buildl})
endmacro()
