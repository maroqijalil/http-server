add_executable(
  httpd
  src/httpd_mongoose/simplest_web_server.cpp
)

add_executable(
  mic
  src/httpd_micro/src/microhttpd.c
)

target_link_libraries(
  httpd PRIVATE
  mongoose
)

target_link_libraries(
  mic PRIVATE
  microhttpd
)