# CONFIGURE ENV
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_PROCESSOR aarch64)

# DETERMINE THE CORRECT CROSS COMPILER
if ("${LOCAL_AARCH64_FILE}" STREQUAL "")
  set(LOCAL_AARCH64_FILE ${CMAKE_CURRENT_LIST_DIR}/../local_aarch64.cmake)
endif()

message(STATUS "Loading: ${LOCAL_AARCH64_FILE}")
if(EXISTS ${LOCAL_AARCH64_FILE})
  include(${LOCAL_AARCH64_FILE})
  message("Loaded: ${LOCAL_AARCH64_FILE}")
endif()

if(NOT EXISTS "${CROSS_COMPILE_CC}")
  if(EXISTS /projects/oss/x-tools/aarch64-unknown-linux-gnu)
    set(TOOLCHAIN_BASE /projects/oss/x-tools/aarch64-unknown-linux-gnu)
    SET(TOOLCHAIN_DIR ${TOOLCHAIN_BASE})
    set(CMAKE_SYSROOT /projects/oss/x-tools/aarch64-unknown-linux-gnu/aarch64-unknown-linux-gnu/sysroot)
    SET(CROSS_COMPILE /projects/oss/x-tools/aarch64-unknown-linux-gnu/bin/aarch64-unknown-linux-gnu-)
    SET(CROSS_COMPILE_CC ${CROSS_COMPILE}gcc)
    SET(CROSS_COMPILE_CXX ${CROSS_COMPILE}g++)
  elseif(EXISTS /usr/bin/aarch64-linux-gnu-gcc-6)
    SET(TOOLCHAIN_BASE /usr/lib/gcc-cross/aarch64-linux-gnu)
    SET(TOOLCHAIN_DIR ${TOOLCHAIN_BASE}/6.4.0)
    SET(CROSS_COMPILE /usr/bin/aarch64-linux-gnu-)
    SET(CROSS_COMPILE_CC ${CROSS_COMPILE}gcc-6)
    SET(CROSS_COMPILE_CXX ${CROSS_COMPILE}g++-6)
  else()
    message(FATAL "NO COMPILER FOUND FOR AARCH64")
  endif()
endif()

if(NOT EXISTS "${CROSS_COMPILE_CC}" OR NOT EXISTS "${CMAKE_SYSROOT}")
  message(FATAL "NO COMPILER FOUND FOR AARCH64 OR NO SYSROOT")
endif()

SET(CMAKE_C_COMPILER  ${CROSS_COMPILE_CC})
SET(CMAKE_CXX_COMPILER ${CROSS_COMPILE_CXX})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
SET(CMAKE_SIZEOF_VOID_P 8)




