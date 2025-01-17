#include "LuaBindings.h"
#include "AbstractGame.h"
#include <iostream>
#include "GameEngine.h"

void LuaBindings::RegisterBindings(sol::state& lua) {
    lua.new_usertype<AbstractGame>("AbstractGame",
        "Initialize", &AbstractGame::Initialize,
        "OnStart", &AbstractGame::Start,
        "OnEnd", &AbstractGame::End,
        "MouseButtonAction", &AbstractGame::MouseButtonAction,
        "MouseWheelAction", &AbstractGame::MouseWheelAction,
        "MouseMove", &AbstractGame::MouseMove,
        "CheckKeyboard", &AbstractGame::CheckKeyboard,
        "KeyPressed", &AbstractGame::KeyPressed,
        "Paint", &AbstractGame::Paint,
        "Tick", &AbstractGame::Tick
    );

    lua.new_usertype<GameEngine>("GameEngine",
        "SetTitle", &GameEngine::SetTitle,
        "SetWidth", &GameEngine::SetWidth,
        "SetHeight", &GameEngine::SetHeight,
        "SetFrameRate", &GameEngine::SetFrameRate,
        "SetGame", &GameEngine::SetGame,
        "scream", &GameEngine::Print,
        "Run", &GameEngine::Run,
        "Quit", &GameEngine::Quit
    );

    lua["GAME_ENGINE"] = GAME_ENGINE;
}

int LuaBindings::ExceptionsHandler(lua_State* L, sol::optional<const std::exception&> maybe_exception, sol::string_view description) {
    if (maybe_exception) {
        const std::exception& ex = *maybe_exception;
        std::cerr << "An exception occurred: " << ex.what() << std::endl;
    } else {
        std::cerr << "An error occurred: " << description << std::endl;
    }
    return sol::stack::push(L, description);
}