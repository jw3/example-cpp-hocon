cmake_minimum_required(VERSION 3.9)
project(example_cpp_hocon)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

set(MODULE example_hocon)
set(CMAKE_CXX_STANDARD 11)

find_package(CPPHOCON REQUIRED)
find_package(Leatherman REQUIRED COMPONENTS locale catch nowide util)
find_package(Boost 1.54 COMPONENTS regex locale thread date_time chrono system program_options REQUIRED)

add_executable(${MODULE} main.cpp)
target_include_directories(${MODULE} PRIVATE ${CPPHOCON_INCLUDES})
target_link_libraries(${MODULE} ${CPPHOCON_LIBRARIES} ${LEATHERMAN_LIBRARIES} ${Boost_LIBRARIES})
