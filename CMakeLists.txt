
# THIS IS UGLY - NEEDS CLEANUP - LESS EXHAUSTION :)

cmake_minimum_required(VERSION 3.0.2)
include(${CMAKE_CURRENT_LIST_DIR}/.cxxpods/cxxpods.cmake)

project(cxxpods_example)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "-fPIC -fPIE")
set(CMAKE_CXX_FLAGS "-fPIC -fPIE")


file(GLOB PROTO_SRC ${CMAKE_CURRENT_LIST_DIR}/src/proto/*.proto)
find_tool(Protobuf REQUIRED)
protoc(${CMAKE_CURRENT_BINARY_DIR}/generated PROTO_CPP_SRC ${PROTO_SRC})

add_executable(cxxpods_example src/main.cpp ${PROTO_CPP_SRC})
target_include_directories(cxxpods_example PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/generated)

foreach(_pkg Protobuf FFMPEG)
  find_package(${_pkg} REQUIRED)
  message(STATUS "${_pkg}: ${${_pkg}_LIBRARIES}")
  target_link_libraries(cxxpods_example ${${_pkg}_LIBRARIES})
endforeach()


target_link_libraries(cxxpods_example dl pthread)


