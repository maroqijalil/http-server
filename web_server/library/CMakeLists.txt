list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/microhttpd")

include(
  FindLibMicroHTTPD
)

# find_package(
#   microhttpd REQUIRED
# )

add_library(
  mongoose
  mongoose/include/mongoose.h
  mongoose/src/mongoose.c
)

target_include_directories(
  mongoose PUBLIC
  "${CMAKE_CURRENT_SOURCE_DIR}/mongoose/include"
)

target_compile_definitions(
  mongoose PUBLIC
  SOURCE="${PROJECT_SOURCE_DIR}"
)

# install(
#   FILES
#     ${CMAKE_CURRENT_SOURCE_DIR}/microhttpd/LibMicrohttpdConfig.cmake
#     ${CMAKE_CURRENT_SOURCE_DIR}/microhttpd/LibMicrohttpd.cmake
#   DESTINATION
#     share/cmake/microhttpd
# )