add_executable(
  httpd
  src/simplest_web_server.cpp
)

target_link_libraries(
  httpd PRIVATE
  mongoose
)