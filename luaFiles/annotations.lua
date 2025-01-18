--- @meta

--- @class Rect
--- Represents a rectangle with a position and size.
--- @field left number
--- @field top number
--- @field right number
--- @field bottom number

--- @class GameEngine
--- Represents the game engine with various settings and controls.
GAME_ENGINE = {}

--- Sets the window title.
--- @param title string # The title of the window.
--- @return nil
function GAME_ENGINE:set_title(title) end

--- Sets the window width.
--- @param width number # The width of the window.
--- @return nil
function GAME_ENGINE:set_width(width) end

--- Sets the window height.
--- @param height number # The height of the window.
--- @return nil
function GAME_ENGINE:set_height(height) end

--- Sets the frame rate of the game.
--- @param frame_rate number # The frame rate of the game.
--- @return nil
function GAME_ENGINE:set_frame_rate(frame_rate) end

--- Draws a round rectangle.
--- @param left number # The left position of the rectangle.
--- @param top number # The top position of the rectangle.
--- @param right number # The right position of the rectangle.
--- @param bottom number # The bottom position of the rectangle.
--- @param radius number # The radius of the corners.
--- @return boolean
function GAME_ENGINE:draw_round_rect(left, top, right, bottom, radius) end

--- Fills a round rectangle.
--- @param left number # The left position of the rectangle.
--- @param top number # The top position of the rectangle.
--- @param right number # The right position of the rectangle.
--- @param bottom number # The bottom position of the rectangle.
--- @param radius number # The radius of the corners.
--- @return boolean
function GAME_ENGINE:fill_round_rect(left, top, right, bottom, radius) end

--- Draws an oval.
--- @param left number # The left position of the oval.
--- @param top number # The top position of the oval.
--- @param right number # The right position of the oval.
--- @param bottom number # The bottom position of the oval.
--- @return boolean
function GAME_ENGINE:draw_oval(left, top, right, bottom) end

--- Fills an oval.
--- @param left number # The left position of the oval.
--- @param top number # The top position of the oval.
--- @param right number # The right position of the oval.
--- @param bottom number # The bottom position of the oval.
--- @param opacity number # The opacity of the fill (optional).
--- @return boolean
--- @overload fun(left: integer, top: integer, right: integer, bottom: integer): boolean
function GAME_ENGINE:fill_oval(left, top, right, bottom, opacity) end

--- Draws an arc.
--- @param left number # The left position of the arc.
--- @param top number # The top position of the arc.
--- @param right number # The right position of the arc.
--- @param bottom number # The bottom position of the arc.
--- @param startDegree number # The starting degree of the arc.
--- @param angle number # The angle of the arc.
--- @return boolean
function GAME_ENGINE:draw_arc(left, top, right, bottom, startDegree, angle) end

--- Fills an arc.
--- @param left number # The left position of the arc.
--- @param top number # The top position of the arc.
--- @param right number # The right position of the arc.
--- @param bottom number # The bottom position of the arc.
--- @param startDegree number # The starting degree of the arc.
--- @param angle number # The angle of the arc.
--- @return boolean
function GAME_ENGINE:fill_arc(left, top, right, bottom, startDegree, angle) end

--- Draws a string within a specified rectangle.
--- @param text string # The text to draw.
--- @param left integer # The left coordinate of the bounding rectangle.
--- @param top integer # The top coordinate of the bounding rectangle.
--- @param right integer # The right coordinate of the bounding rectangle.
--- @param bottom integer # The bottom coordinate of the bounding rectangle.
--- @return integer
--- @overload fun(text: string, left: integer, top: integer): integer
function GAME_ENGINE:draw_string(text, left, top, right, bottom) end

--- Sets the brush color
--- @param r integer # The red component of the color (0-255)
--- @param g integer # The green component of the color (0-255)
--- @param b integer # The blue component of the color (0-255)
--- @return nil
function GAME_ENGINE:set_color(r, g, b) end
