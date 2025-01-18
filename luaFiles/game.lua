-- Define special keys
local VK_LEFT = 0x25
local VK_RIGHT = 0x27
local VK_UP = 0x26
local VK_DOWN = 0x28
local VK_SPACE = 0x20
local VK_ESCAPE = 0x1B

function update()
    --print("Stuff")
end

function initialize()
    GAME_ENGINE:set_title("Lua game")
    GAME_ENGINE:set_width(800)
    GAME_ENGINE:set_height(600)
    GAME_ENGINE:set_frame_rate(60)

    GAME_ENGINE:set_key_list({VK_SPACE})
end

function on_begin()
end

function on_end()
end

--- @param rect Rect # The window rect
function paint(rect)
    GAME_ENGINE:fill_window_rect(50 , 150, 200)
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
    --if GAME_ENGINE:is_key_down("W") then
    --    print("W key is pressed")
    --end
    --if GAME_ENGINE:is_key_down(VK_LEFT) then
    --    print("Left arrow key is pressed")
    --end
end

--- @param key string # The key that was pressed
function key_pressed(key)
    --print (key)
    --if key == "W" then
    --    print("W key is pressed")
    --end
    ----check if the left arrow key is pressed
    --if key == VK_LEFT then
    --    print("Left arrow key is pressed")
    --end
end

--- @param x integer # The x-coordinate of the mouse wheel
--- @param y integer # The y-coordinate of the mouse wheel
--- @param distance integer # The change in x-coordinate
function mouse_wheel_action(x, y, distance)
end