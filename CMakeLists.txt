project(Andromeda)

cmake_minimum_required(VERSION 3.0.0)

# Sets ${ARCH} to the operating system's architecture
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(ARCH 64)
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(ARCH 86)
endif()

set(BUILD_VERSION 0.0.1)

set(BIN_DIR ${CMAKE_SOURCE_DIR}/Bin/Release/x${ARCH})
set(INCLUDE_DIR ${CMAKE_SOURCE_DIR}/Dist/Include)
set(LIBS_DIR ${CMAKE_SOURCE_DIR}/Dist/Libs/x${ARCH})
set(SRC_DIR ${CMAKE_SOURCE_DIR}/Source)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BIN_DIR})
include_directories(${INCLUDE_DIR})
link_directories(${LIBS_DIR})
include(CTest)
enable_testing()

file(GLOB_RECURSE SOURCE_FILES
    ${SRC_DIR}/*.cpp
)

file(GLOB LIB_FILES
    ${LIBS_DIR}/*.lib
)

set(LINKER_FLAGS opengl32 ${LIB_FILES})

add_executable(Andromeda ${SOURCE_FILES})
target_link_libraries(Andromeda ${LINKER_FLAGS})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
