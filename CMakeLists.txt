
# THIS IS UGLY - NEEDS CLEANUP - LESS EXHAUSTION :)

cmake_minimum_required(VERSION 3.10)
include(${CMAKE_CURRENT_LIST_DIR}/.cunit/cunit.cmake)

project(cunit_example)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "-fPIC -fPIE")
set(CMAKE_CXX_FLAGS "-fPIC -fPIE")

add_executable(cunit_example main.cpp)

function(add_packages)
  foreach(_pkg Protobuf OpenCV FFMPEG ZLIB TIFF JPEG PNG)
    find_package(${_pkg} REQUIRED)
    list(APPEND _libs ${${_pkg}_LIBRARIES})
    target_link_libraries(cunit_example ${${_pkg}_LIBRARIES})
  endforeach()

  set(PKG_LIBRARIES ${PKG_LIBRARIES} ${_libs} PARENT_SCOPE)
endfunction()

add_packages()
target_link_libraries(cunit_example dl pthread)


if(APPLE)
  function(add_apple_packages)
    foreach(_fw VideoToolbox CoreVideo AudioToolbox CoreAudio CoreFoundation CoreMedia)
      find_library(${_fw}_lib ${_fw})
      message(STATUS "${_fw}: ${${_fw}_lib}")
      target_link_libraries(cunit_example ${${_fw}_lib})
    endforeach()
    target_link_libraries(cunit_example lzma iconv)
  endfunction()

  add_apple_packages()
endif()
