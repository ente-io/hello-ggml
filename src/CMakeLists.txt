# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(hello_ggml_library VERSION 0.0.1 LANGUAGES C)

add_library(hello_ggml SHARED
  "hello_ggml.c"
)

set_target_properties(hello_ggml PROPERTIES
  PUBLIC_HEADER hello_ggml.h
  OUTPUT_NAME "hello_ggml"
)

target_compile_definitions(hello_ggml PUBLIC DART_SHARED_LIB)
