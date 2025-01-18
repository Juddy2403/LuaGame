
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
    GAME_ENGINE:fill_window_rect(100 , 0, 0)
    GAME_ENGINE:set_color(255, 255, 255)
    ---GAME_ENGINE:draw_line(25, 25, 500, 500)

    local points = {
        Point.new(100, 100),
        Point.new(200, 100),
        Point.new(200, 200),
        Point.new(100, 200),
        Point.new(50, 140),
        Point.new(100, 100)
    }

    -- Call the fill_polygon function
    local success = GAME_ENGINE:draw_polygon(points, #points)
end