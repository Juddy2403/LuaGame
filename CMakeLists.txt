cmake_minimum_required(VERSION 3.20)
project(LuaProject)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(EXE_NAME LuaGame)

# Set Unicode definition - Win32API specific configuration
add_definitions(-DUNICODE -D_UNICODE)

# Fetching the required libraries
include(FetchContent)

# Fetch LUA
# ++++++++++
FetchContent_Declare(
        lua
        URL https://github.com/marovira/lua/archive/refs/tags/5.4.4.tar.gz
)
FetchContent_MakeAvailable(lua)

# Fetch SOL2
# ++++++++++
FetchContent_Declare(
        sol2
        URL https://github.com/ThePhD/sol2/archive/refs/tags/v3.3.0.tar.gz
)
FetchContent_MakeAvailable(sol2)

# Fetch SDL2
# ++++++++++
FetchContent_Declare(
        sdl
        URL https://github.com/libsdl-org/SDL/releases/download/release-2.30.9/SDL2-2.30.9.tar.gz
)
FetchContent_MakeAvailable(sdl)

# Gather Sources
# ++++++++++++++
file(GLOB SOURCES "source/*.cpp" "source/*.h")
file(GLOB LUA_SOURCES "luaFiles/*.lua")

# Add the executable target
add_executable(${EXE_NAME} WIN32 ${SOURCES} ${LUA_SOURCES})

# Link the libraries
target_link_libraries(${EXE_NAME} PRIVATE SDL2::SDL2-static lua::lua sol2)

# Include and directories
target_include_directories(${EXE_NAME} PRIVATE source resources luaFiles)
target_include_directories(${EXE_NAME} PRIVATE ${SDL2_SOURCE_DIR}/include)
include_directories(${CMAKE_SYSTEM_INCLUDE_PATH})

# Set linker options for Windows subsystem
set_target_properties(${EXE_NAME} PROPERTIES
        VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}")  # Set the working directory

# Copy Lua Scripts
# ++++++++++++++++
add_custom_target(CopyScripts ALL
        COMMENT "Copying Lua scripts to output directory")

FOREACH (LUA_SOURCE IN LISTS LUA_SOURCES)
    add_custom_command(TARGET CopyScripts POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
            ${CMAKE_CURRENT_SOURCE_DIR}/${LUA_SOURCE}
            $<TARGET_FILE_DIR:${EXE_NAME}>/${LUA_SOURCE})
ENDFOREACH ()

add_dependencies(CopyScripts ${EXE_NAME})

