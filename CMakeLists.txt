cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

find_program(CMAKE_C_COMPILER NAMES $ENV{CC} gcc PATHS ENV PATH NO_DEFAULT_PATH)
find_program(CMAKE_CXX_COMPILER NAMES $ENV{CXX} g++ PATHS ENV PATH NO_DEFAULT_PATH)

set(CMAKE_CXX_STANDARD 17)

project(ndnusyst VERSION 23.06 LANGUAGES CXX)

#Changes default install path to be a subdirectory of the build dir.
#Can set build dir at configure time with -DCMAKE_INSTALL_PREFIX=/install/path
if(CMAKE_INSTALL_PREFIX STREQUAL "" OR CMAKE_INSTALL_PREFIX STREQUAL
  "/usr/local")
  set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}")
elseif(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}")
endif()

if(CMAKE_BUILD_TYPE STREQUAL "")
  set(CMAKE_BUILD_TYPE DebWithRelInfo)
endif()

find_package(nusystematics 02.00.01 REQUIRED)
find_package(duneanaobj 03.02.01 REQUIRED)
find_package(GENIE3 REQUIRED)
if(NOT TARGET GENIE3::All)
  message(FATAL_ERROR "Expected find_package(GENIE3 REQUIRED) call to set up target GENIE3::All.")
endif()

###### Compiler set up
add_library(ndnusyst_dependencies INTERFACE)
target_link_libraries(ndnusyst_dependencies INTERFACE fhiclcpp::fhiclcpp)
target_include_directories(ndnusyst_dependencies INTERFACE 
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
  $<INSTALL_INTERFACE:include> )
set_target_properties(ndnusyst_dependencies PROPERTIES EXPORT_NAME commondeps)
add_library(ndnusyst::commondeps ALIAS ndnusyst_dependencies)

install(TARGETS ndnusyst_dependencies EXPORT ndnusyst-targets)

add_subdirectory(app)

install(EXPORT ndnusyst-targets
        NAMESPACE ndnusyst::
        DESTINATION lib/cmake/ndnusyst)

