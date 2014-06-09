include_directories(${LUABYTES_SOURCE_DIR}/lib/src)
link_directories(${LUABYTES_BINARY_DIR}/lib/src)
add_executable(luabytesDemo demo.cpp)
target_link_libraries(luabytesDemo luabytes)
