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

# soft link for data files
macro(create_data_link path)
  set(SOURCE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../${path}")
  set(LINK_PATH "${path}")
  if(UNIX)
    execute_process(
      COMMAND ln -sf ${SOURCE_PATH} ${LINK_PATH}
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
      RESULT_VARIABLE result)
  elseif(WIN32)
    execute_process(
      COMMAND cmd.exe /c mklink /D ${LINK_PATH} ${SOURCE_PATH}
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
      RESULT_VARIABLE result)
  else()
    message(
      FATAL_ERROR "Symbolic link creation is not supported on this platform.")
  endif()
endmacro()


enable_testing()
create_data_link(FMS_RC.nml)
create_data_link(CE_tables)
create_data_link(hybrid_sigma)
create_data_link(opac_data)
create_data_link(sw_flux)

setup_test(test_exofms)
