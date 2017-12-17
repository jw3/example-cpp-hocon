cmake_minimum_required(VERSION 3.9)
project(example_cpp_hocon)

set(MODULE example_hocon)
set(CMAKE_CXX_STANDARD 11)

find_package(Leatherman REQUIRED COMPONENTS locale catch nowide util)
find_package(Boost 1.54 COMPONENTS regex locale thread date_time chrono system program_options REQUIRED)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/modules)
include(External_CppHocon)

add_executable(${MODULE} main.cpp)
target_include_directories(${MODULE} PRIVATE ${HOCON_INCLUDES})
target_link_libraries(${MODULE} ${HOCON_LIBRARY} ${LEATHERMAN_LIBRARIES} ${Boost_LIBRARIES})
