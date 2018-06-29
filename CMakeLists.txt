cmake_minimum_required(VERSION 3.10)
project(cunit_example)

set(CMAKE_CXX_STANDARD 17)

message(status "System: ${CMAKE_SYSTEM_NAME} Procesor: ${CMAKE_SYSTEM_PROCESSOR}")
get_cmake_property(_variableNames VARIABLES)
list (SORT _variableNames)
foreach (_variableName ${_variableNames})
  message(STATUS "${_variableName}=${${_variableName}}")
endforeach()
add_executable(cunit_example main.cpp)