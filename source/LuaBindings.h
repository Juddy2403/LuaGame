#pragma once
#include <sol/optional_implementation.hpp>
#include <sol/state.hpp>
#include <sol/string_view.hpp>
#include "lua.h"

class LuaBindings {
public:
    static void RegisterBindings(sol::state& lua);
    static int ExceptionsHandler(lua_State* L, sol::optional<const std::exception&> maybe_exception, sol::string_view description);
};
