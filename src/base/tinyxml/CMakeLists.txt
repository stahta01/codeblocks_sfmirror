cmake_minimum_required(VERSION 3.15)
project(tinyxml)

include_directories("${CB_SRC_ROOT}/include/tinyxml")

add_library(tinyxml tinyxml.cpp tinyxmlerror.cpp tinyxmlparser.cpp)
