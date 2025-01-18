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

# Gather Sources
# ++++++++++++++
file(GLOB SOURCES "source/*.cpp" "source/*.h")
file(GLOB LUA_SOURCES "luaFiles/*.lua")

# Add the executable target
add_executable(${EXE_NAME} WIN32 ${SOURCES} ${LUA_SOURCES})

# Link the libraries
target_link_libraries(${EXE_NAME} PRIVATE lua::lua sol2)

# Include and directories
target_include_directories(${EXE_NAME} PRIVATE source luaFiles)
include_directories(${CMAKE_SYSTEM_INCLUDE_PATH})

# Set linker options for Windows subsystem
set_target_properties(${EXE_NAME} PROPERTIES
        VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}")  # Set the working directory

# Copy Lua Scripts
# ++++++++++++++++
# Define the target directory (build output directory)
set(LUA_TARGET_DIR "${CMAKE_CURRENT_BINARY_DIR}/luaFiles")

# Create a custom target to copy Lua files
add_custom_target(CopyLuaFiles ALL
        COMMAND ${CMAKE_COMMAND} -E make_directory "${LUA_TARGET_DIR}"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${LUA_SOURCES}
        "${LUA_TARGET_DIR}"
        COMMENT "Copying Lua files to build directory."
)

# Ensure the Lua files are copied before the executable runs
add_dependencies(${EXE_NAME} CopyLuaFiles)

