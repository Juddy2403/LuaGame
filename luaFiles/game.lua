-- Game variables
local bird = { x = 100, y = 300, radius = 20, dy = 0 }
local pipes = {}
local pipeWidth = 50
local pipeGap = 200
local pipeSpeed = 5
local pipeAcceleration = 0.001
local gravity = 0.2
local jumpStrength = -5
local score = 0
local FRAME_RATE = 60

function initialize()
    GAME_ENGINE:set_title("Flappy Bird")
    GAME_ENGINE:set_width(800)
    GAME_ENGINE:set_height(600)
    GAME_ENGINE:set_frame_rate(FRAME_RATE)
    GAME_ENGINE:set_key_list({ SPACE_KEY })
    table.insert(pipes, { x = 800, y = math.random(100, 400) })
end

function on_begin()
end

function on_end()
end

function update()
    -- Apply gravity to the bird
    bird.dy = bird.dy + gravity
    bird.y = bird.y + bird.dy

    pipeSpeed = pipeSpeed + pipeAcceleration

    ---Move pipes and check for collisions
    for i, pipe in ipairs(pipes) do
        pipe.x = pipe.x - pipeSpeed

        -- Check for collision with bird
        if bird.x + bird.radius > pipe.x and bird.x - bird.radius < pipe.x + pipeWidth then
            if bird.y - bird.radius < pipe.y or bird.y + bird.radius > pipe.y + pipeGap then
                print("Collided with bird!" .. score)
            end
        end

        -- Remove pipes that are off-screen and add new pipes
        if pipe.x + pipeWidth < 0 then
            table.remove(pipes, i)
            table.insert(pipes, { x = 800, y = math.random(100, 400) })
            score = score + 1
        end
    end

    -- Check if the bird hits the ground or flies too high
    if bird.y + bird.radius > 600 or bird.y - bird.radius < 0 then
        print("Hit ceiling/floor " .. score)
    end
end

--- @param rect Rect # The window rect
function paint(rect)
    GAME_ENGINE:fill_window_rect(135, 206, 235) -- Sky blue background

    -- Draw the bird
    GAME_ENGINE:set_color(255, 0, 0) -- Red color
    GAME_ENGINE:fill_oval(bird.x - bird.radius, math.floor(bird.y - bird.radius)
    , bird.x + bird.radius, math.floor(bird.y + bird.radius))

    -- Draw the pipes
    GAME_ENGINE:set_color(0, 255, 0) -- Green color
    for _, pipe in ipairs(pipes) do
        GAME_ENGINE:fill_rect(math.floor(pipe.x), 0, math.floor(pipe.x + pipeWidth), math.floor(pipe.y))
        GAME_ENGINE:fill_rect(math.floor(pipe.x), math.floor(pipe.y + pipeGap), math.floor(pipe.x + pipeWidth), 600)
    end

    -- Draw the score
    GAME_ENGINE:set_color(255, 255, 255) -- White color
    GAME_ENGINE:draw_string("Score: " .. score, 10, 10)

end

--- @param isLeft boolean # The left mouse button state
--- @param isDown boolean # The mouse button state
--- @param x integer # The x-coordinate of the mouse
--- @param y integer # The y-coordinate of the mouse
function mouse_button_action(isLeft, isDown, x, y)
    if isLeft and isDown then
        bird.dy = jumpStrength
    end
end

--- @param x integer # The x-coordinate of the mouse
--- @param y integer # The y-coordinate of the mouse
function mouse_move(x, y)
end

--- Checks all keys for key triggered
function check_keyboard()
    --if GAME_ENGINE:is_key_down("W") then
    --    print("W key is pressed")
    --end
    --if GAME_ENGINE:is_key_down(LEFT_KEY) then
    --    print("Left arrow key is pressed")
    --end
end

--- Checks only specific keys (set by set_key_list) for key release
--- @param key string # The key that was pressed
function key_pressed(key)
    --print (key)
    --if key == "W" then
    --    print("W key is pressed")
    --end
    --check if the left arrow key is pressed
    --if key == VK_LEFT then
    --    print("Left arrow key is pressed")
    --end
    if key == SPACE_KEY then
        bird.dy = jumpStrength
    end
end

--- @param x integer # The x-coordinate of the mouse wheel
--- @param y integer # The y-coordinate of the mouse wheel
--- @param distance integer # The change in x-coordinate
function mouse_wheel_action(x, y, distance)
end