﻿#include "LuaBindings.h"
#include <iostream>
#include "LuaGame.h"
#include "GameEngine.h"

void LuaBindings::RegisterBindings(sol::state &lua) {
    lua.new_usertype<POINT>("Point",
                            sol::constructors<POINT(), POINT(LONG, LONG)>(),
                            "x", &POINT::x,
                            "y", &POINT::y
    );

    lua.new_usertype<RECT>("Rect",
                           "left", &RECT::left,
                           "top", &RECT::top,
                           "right", &RECT::right,
                           "bottom", &RECT::bottom
    );

    lua.new_usertype<GameEngine>
    ("GameEngine",
     "set_title", &GameEngine::SetTitle,
     "set_width", &GameEngine::SetWidth,
     "set_height", &GameEngine::SetHeight,
     "set_frame_rate", &GameEngine::SetFrameRate,
     "fill_window_rect", sol::resolve<bool(int, int, int) const>(&GameEngine::FillWindowRect),
     "draw_round_rect", &GameEngine::DrawRoundRect,
     "fill_round_rect", &GameEngine::FillRoundRect,
     "draw_line", &GameEngine::DrawLine,
     "draw_oval", &GameEngine::DrawOval,
     "draw_rect", &GameEngine::DrawRect,
     "fill_rect", sol::overload(
         sol::resolve<bool(int, int, int, int) const>(&GameEngine::FillRect),
         sol::resolve<bool(int, int, int, int, int) const>(&GameEngine::FillRect)),
     "fill_oval", sol::overload(
         sol::resolve<bool(int, int, int, int) const>(&GameEngine::FillOval),
         sol::resolve<bool(int, int, int, int, int) const>(&GameEngine::FillOval)),
     "draw_arc", &GameEngine::DrawArc,
     "fill_arc", &GameEngine::FillArc,
     "draw_string", sol::overload(
         sol::resolve<int(const tstring &, int, int, int, int) const>(&GameEngine::DrawString),
         sol::resolve<int(const tstring &, int, int) const>(&GameEngine::DrawString)),
     "draw_polygon", [](GameEngine &self, sol::table pointsTable, int count) {
         std::vector<POINT> points;
         for (int i = 1; i <= count; ++i) {
             sol::table pointTable = pointsTable[i];
             POINT point;
             point.x = pointTable["x"];
             point.y = pointTable["y"];
             points.push_back(point);
         }
         return self.DrawPolygon(points.data(), count);
     },
     "fill_polygon", [](GameEngine &self, sol::table pointsTable, int count) {
         std::vector<POINT> points;
         for (int i = 1; i <= count; ++i) {
             sol::table pointTable = pointsTable[i];
             POINT point;
             point.x = pointTable["x"];
             point.y = pointTable["y"];
             points.push_back(point);
         }
         return self.FillPolygon(points.data(), count);
     },
     "set_color", sol::resolve<void(int, int, int)>(&GameEngine::SetColor),
     "is_key_down", [](GameEngine &self, sol::object key) {
         if (key.is<std::string>()) {
             std::string keyStr = key.as<std::string>();
             if (keyStr.length() == 1) {
                 return self.IsKeyDown(static_cast<int>(keyStr[0]));
             }
         } else if (key.is<int>()) {
             return self.IsKeyDown(key.as<int>());
         }
         return false;
     },
     "set_key_list", [](GameEngine &self, sol::table keys) {
         tstringstream buffer;
         for (auto &kv: keys) {
             sol::object key = kv.second;
             if (key.is<std::string>()) {
                 std::string keyStr = key.as<std::string>();
                 if (keyStr.length() == 1) {
                     buffer << keyStr[0];
                 }
             } else if (key.is<int>()) {
                 buffer << static_cast<char>(key.as<int>());
             }
         }
         self.SetKeyList(buffer.str());
     }
    );

    lua["GAME_ENGINE"] = GAME_ENGINE;

    // Special key bindings (other than keyboard letters)
    lua["LEFT_KEY"] = VK_LEFT;
    lua["RIGHT_KEY"] = VK_RIGHT;
    lua["UP_KEY"] = VK_UP;
    lua["DOWN_KEY"] = VK_DOWN;
    lua["SPACE_KEY"] = VK_SPACE;
    lua["ENTER_KEY"] = VK_RETURN;
    lua["ESCAPE_KEY"] = VK_ESCAPE;
    // ...
}

int LuaBindings::ExceptionsHandler(lua_State *L, sol::optional<const std::exception &> maybe_exception,
                                   sol::string_view description) {
    if (maybe_exception) {
        const std::exception &ex = *maybe_exception;
        std::cerr << "An exception occurred: " << ex.what() << std::endl;
    } else {
        std::cerr << "An error occurred: " << description << std::endl;
    }
    return sol::stack::push(L, description);
}
