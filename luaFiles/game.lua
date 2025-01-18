
function update()
    --print("Stuff")
end

function initialize()
    GAME_ENGINE:set_title("Lua game")
    GAME_ENGINE:set_width(800)
    GAME_ENGINE:set_height(600)
    GAME_ENGINE:set_frame_rate(60)

    GAME_ENGINE:set_key_list("WASD")
end

function on_begin()

end

function on_end()

end

--- @param rect Rect # The window rect
function paint(rect)
    GAME_ENGINE:fill_window_rect(100 , 0, 0)
    GAME_ENGINE:set_color(255, 255, 255)

end

--- @param isLeft boolean # The left mouse button state
--- @param isDown boolean # The mouse button state
--- @param x integer # The x-coordinate of the mouse
--- @param y integer # The y-coordinate of the mouse
function mouse_button_action(isLeft, isDown, x, y)
    if isLeft and isDown then
        --print("Left mouse button is pressed")
    end
end

--- @param x integer # The x-coordinate of the mouse
--- @param y integer # The y-coordinate of the mouse
function mouse_move(x, y)

end

function check_keyboard()
    if GAME_ENGINE:is_key_down("W") then
       -- print("W key is pressed")
    end
end

--- @param key string # The key that was pressed
function key_pressed(key)
    --if key == "W" then
    --    print("W key is pressed")
    --end
end