cmake_minimum_required(VERSION 3.28)
project(userver-samples-hello_service CXX)
set(CMAKE_CXX_STANDARD 17)

if(APPLE)
    # Указываем CMake путь к Homebrew ICU
    set(ICU_ROOT "/opt/homebrew/opt/icu4c@77")
    list(APPEND CMAKE_PREFIX_PATH "${ICU_ROOT}")
    set(CMAKE_INCLUDE_PATH "${ICU_ROOT}/include")
    set(CMAKE_LIBRARY_PATH "${ICU_ROOT}/lib")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -L${ICU_ROOT}/lib")
endif()

# Добавляем userver
add_subdirectory(userver)
userver_setup_environment()

# Исходники
add_library(${PROJECT_NAME}_objs OBJECT
        message.hxx message.cxx
        handlers.hxx handlers.cxx
)
target_include_directories(${PROJECT_NAME}_objs PUBLIC src)
target_link_libraries(${PROJECT_NAME}_objs userver::core)


# Основной бинарник
add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE ${PROJECT_NAME}_objs)

