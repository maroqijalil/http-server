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