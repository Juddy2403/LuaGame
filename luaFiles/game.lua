---@class Bird
---@field x number
---@field y number
---@field radius number
---@field dy number

---@class Pipe
---@field x number
---@field y number

-- Game variables
---@type boolean
local is_paused = true
---@type boolean
local game_started = false
---@type boolean
local game_lost = false
---@type Bird
local bird = { x = 100, y = 300, radius = 20, dy = 0 }
---@type Pipe[]
local pipes = {}
---@type number
local pipe_width = 50
---@type number
local pipe_gap = 200
---@type number
local pipe_speed = 5
---@type number
local pipe_acceleration = 0.001
---@type number
local gravity = 0.2
---@type number
local jumpStrength = -5
---@type number
local score = 0
---@type number
local FRAME_RATE = 60

--- Initializes the game
function initialize()
    GAME_ENGINE:set_title("Flappy Bird")
    GAME_ENGINE:set_width(800)
    GAME_ENGINE:set_height(600)
    GAME_ENGINE:set_frame_rate(FRAME_RATE)
    GAME_ENGINE:set_key_list({ SPACE_KEY, 'R' })
    table.insert(pipes, { x = 800, y = math.random(100, 400) })
end

--- Resets the game to its initial state
function reset_game()
    is_paused = true
    game_started = false
    game_lost = false
    bird = { x = 100, y = 300, radius = 20, dy = 0 }
    pipes = {}
    pipe_speed = 5
    score = 0
    table.insert(pipes, { x = 800, y = math.random(100, 400) })
end

function on_begin()
    print("Game started!")
end

function on_end()
    print("Game ended!")
end

--- Updates the game state
function update()
    if not is_paused then
        -- Apply gravity to the bird
        bird.dy = bird.dy + gravity
        bird.y = bird.y + bird.dy

        pipe_speed = pipe_speed + pipe_acceleration

        -- Move pipes and check for collisions
        for i, pipe in ipairs(pipes) do
            pipe.x = pipe.x - pipe_speed

            -- Check for collision with bird
            if bird.x + bird.radius > pipe.x and bird.x - bird.radius < pipe.x + pipe_width then
                if bird.y - bird.radius < pipe.y or bird.y + bird.radius > pipe.y + pipe_gap then
                    print("Collided with bird! Score: " .. score)
                    is_paused = true
                    game_lost = true
                end
            end

            -- Remove pipes that are off-screen and add new pipes
            if pipe.x + pipe_width < 0 then
                table.remove(pipes, i)
                table.insert(pipes, { x = 800, y = math.random(100, 400) })
                score = score + 1
            end
        end

        -- Check if the bird hits the ground or flies too high
        if bird.y + bird.radius > 600 or bird.y - bird.radius < 0 then
            print("Hit ceiling/floor! Score: " .. score)
            is_paused = true
            game_lost = true
        end
    end
end

--- Paints the game elements on the screen
---@param rect Rect The window rect
function paint(rect)
    GAME_ENGINE:fill_window_rect(135, 206, 235) -- Sky blue background

    -- Draw the bird
    GAME_ENGINE:set_color(255, 0, 0) -- Red color
    GAME_ENGINE:fill_oval(bird.x - bird.radius, math.floor(bird.y - bird.radius), bird.x + bird.radius, math.floor(bird.y + bird.radius))

    -- Draw the pipes
    GAME_ENGINE:set_color(0, 255, 0) -- Green color
    for _, pipe in ipairs(pipes) do
        GAME_ENGINE:fill_rect(math.floor(pipe.x), 0, math.floor(pipe.x + pipe_width), math.floor(pipe.y))
        GAME_ENGINE:fill_rect(math.floor(pipe.x), math.floor(pipe.y + pipe_gap), math.floor(pipe.x + pipe_width), 600)
    end

    -- Draw the score
    GAME_ENGINE:set_color(255, 255, 255) -- White color
    GAME_ENGINE:draw_string("Score: " .. score, 10, 10)

    -- Draw the start message if the game hasn't started
    if not game_started then
        GAME_ENGINE:set_color(255, 255, 255) -- White color
        GAME_ENGINE:draw_string("Press LMB or SPACE to start", 300, 300)
    end

    -- Draw the game lost message if the game is lost
    if game_lost then
        GAME_ENGINE:set_color(255, 255, 255) -- White color
        GAME_ENGINE:draw_string("Game lost! Score: " .. score, 300, 250)
        GAME_ENGINE:draw_string("Replay by pressing R", 300, 300)
    end
end

--- Handles mouse button actions
---@param isLeft boolean The left mouse button state
---@param isDown boolean The mouse button state
---@param x integer The x-coordinate of the mouse
---@param y integer The y-coordinate of the mouse
function mouse_button_action(isLeft, isDown, x, y)
    if isLeft and isDown then
        if not game_started then
            game_started = true
            is_paused = false
        elseif not game_lost then
            bird.dy = jumpStrength
        end
    end
end

--- Handles mouse movement
---@param x integer The x-coordinate of the mouse
---@param y integer The y-coordinate of the mouse
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

--- Handles key press actions
---@param key string The key that was pressed
function key_pressed(key)
    if key == SPACE_KEY then
        if not game_started then
            game_started = true
            is_paused = false
        elseif not game_lost then
            bird.dy = jumpStrength
        end
    elseif key == 'R' then
        reset_game()
    end
end

--- Handles mouse wheel actions
---@param x integer The x-coordinate of the mouse wheel
---@param y integer The y-coordinate of the mouse
---@param distance integer The change in x-coordinate
function mouse_wheel_action(x, y, distance)
end