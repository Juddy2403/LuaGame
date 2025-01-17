--- AbstractGame class definition
AbstractGame = AbstractGame or {}

--- Game class definition
--- @class Game : AbstractGame
local Game = {}
Game.__index = Game
setmetatable(Game, {__index = AbstractGame})

--- Constructor for the Game class
--- @return Game
function Game:new()
    local instance = setmetatable({}, Game)
    return instance
end

--- Initialize function, called once at the start of the game
function Game:Initialize()
    AbstractGame.Initialize(self)  -- Call the base class Initialize method
    GAME_ENGINE:SetTitle("Lua Game")  -- Set the game window title
    GAME_ENGINE:SetWidth(1024)  -- Set the game window width
    GAME_ENGINE:SetHeight(768)  -- Set the game window height
    GAME_ENGINE:SetFrameRate(50)  -- Set the game frame rate
end

--- Start function, called once when the game starts
function Game:Start()
    -- Insert code that needs to execute at the start of the game
end

--- End function, called once when the game ends
function Game:End()
    -- Insert code that needs to execute when the game ends
end

--- Paint function, called every frame to render the game
--- @param rect table The rectangle to paint
function Game:Paint(rect)
    -- Insert paint code
end

--- Tick function, called every frame to update the game logic
function Game:Tick()
    -- Insert non-paint code that needs to execute each tick
end

--- MouseButtonAction function, called when a mouse button is pressed or released
--- @param isLeft boolean Whether the left mouse button is pressed
--- @param isDown boolean Whether the mouse button is down
--- @param x number The x-coordinate of the mouse
--- @param y number The y-coordinate of the mouse
--- @param wParam number Additional parameter
function Game:MouseButtonAction(isLeft, isDown, x, y, wParam)
    -- Insert code for a mouse button action
end

--- MouseWheelAction function, called when the mouse wheel is scrolled
--- @param x number The x-coordinate of the mouse
--- @param y number The y-coordinate of the mouse
--- @param distance number The distance the wheel is scrolled
--- @param wParam number Additional parameter
function Game:MouseWheelAction(x, y, distance, wParam)
    -- Insert code for a mouse wheel action
end

--- MouseMove function, called when the mouse is moved
--- @param x number The x-coordinate of the mouse
--- @param y number The y-coordinate of the mouse
--- @param wParam number Additional parameter
function Game:MouseMove(x, y, wParam)
    -- Insert code that needs to execute when the mouse pointer moves
end

--- CheckKeyboard function, called to check the state of the keyboard
function Game:CheckKeyboard()
    -- Insert code to check if a key is pressed down
end

--- KeyPressed function, called when a key is pressed
--- @param key string The key that was pressed
function Game:KeyPressed(key)
    -- Insert code that needs to execute when a key is pressed
end

--- Create an instance of the Game class
--- @type Game
local game_instance = Game:new()

--- Set the game instance in the game engine
---GAME_ENGINE:SetGame(game_instance)
GAME_ENGINE:scream()

