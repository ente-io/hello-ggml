cmake_minimum_required(VERSION 3.9)
project(test_ggml VERSION 1.0.0 DESCRIPTION "testggml")
add_library(testggml SHARED "test.cpp")
add_subdirectory(clip.cpp)

target_compile_definitions(testggml PUBLIC DART_SHARED_LIB)
target_link_libraries(testggml PRIVATE clip ggml)