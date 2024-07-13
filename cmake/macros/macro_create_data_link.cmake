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
