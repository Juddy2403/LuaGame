cmake_minimum_required(VERSION 3.20)

# Define the project name and programming language
project(LuaProject)

set(CMAKE_CXX_STANDARD 20)

# Set Unicode definition - Win32API specific configuration
add_definitions(-DUNICODE -D_UNICODE)

# Add the executable target
add_executable(${PROJECT_NAME} WIN32
    "source/GameWinMain.cpp"
    "source/GameWinMain.h"
    "source/AbstractGame.cpp"
    "source/AbstractGame.h"
    "source/Game.cpp"
    "source/Game.h"
    "source/GameDefines.h"
    "source/GameEngine.cpp"
    "source/GameEngine.h"
    "source/resource.h"

    )

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE source resources)
include_directories(${CMAKE_SYSTEM_INCLUDE_PATH})

# Set linker options for Windows subsystem
set_target_properties(${PROJECT_NAME} PROPERTIES
    VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"  # Set the working directory
)
