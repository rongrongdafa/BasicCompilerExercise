add_library(my_libs
add.cpp
add2.cpp
add3.cpp
)
add_executable(my_test main.cpp)
target_link_libraries(my_test my_libs)