
function update()
    --print("Stuff")
end

function initialize()
    GAME_ENGINE:set_title("Lua game")
    GAME_ENGINE:set_width(800)
    GAME_ENGINE:set_height(600)
    GAME_ENGINE:set_frame_rate(60)
end

function on_begin()

end

function on_end()

end

--- @param rect Rect
function paint(rect)
    GAME_ENGINE:set_color(255, 255, 255)
    GAME_ENGINE:fill_round_rect(25, 250, 250, 25, 100)
end