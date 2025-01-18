--- @meta
--- @alias integer number # An integer number.

--- @class Rect
--- Represents a rectangle with a position and size.
--- @field left integer
--- @field top integer
--- @field right integer
--- @field bottom integer
Rect = {}

--- Creates a new Rect instance.
--- @param left integer # The left position of the rectangle.
--- @param top integer # The top position of the rectangle.
--- @param right integer # The right position of the rectangle.
--- @param bottom integer # The bottom position of the rectangle.
--- @return Rect # A new Rect instance.
function Rect.new(left, top, right, bottom) end

--- @class Point
--- Represents a point with x and y coordinates.
--- @field x integer
--- @field y integer
Point = {}

--- Creates a new Point instance.
--- @param x integer # The x-coordinate of the point.
--- @param y integer # The y-coordinate of the point.
--- @return Point # A new Point instance.
function Point.new(x, y) end

--- @class GameEngine
--- Represents the game engine with various settings and controls.
GAME_ENGINE = {}

--- Sets the window title.
--- @param title string # The title of the window.
--- @return nil
function GAME_ENGINE:set_title(title) end

--- Sets the window width.
--- @param width integer # The width of the window.
--- @return nil
function GAME_ENGINE:set_width(width) end

--- Sets the window height.
--- @param height integer # The height of the window.
--- @return nil
function GAME_ENGINE:set_height(height) end

--- Sets the frame rate of the game.
--- @param frame_rate integer # The frame rate of the game.
--- @return nil
function GAME_ENGINE:set_frame_rate(frame_rate) end

--- Colors the window with a specified color.
--- @param r integer # The red component of the color (0-255).
--- @param g integer # The green component of the color (0-255).
--- @param b integer # The blue component of the color (0-255).
--- @return boolean # Returns true if the window was colored successfully.
function GAME_ENGINE:fill_window_rect(r, g, b) end

--- Draws a round rectangle.
--- @param left integer # The left position of the rectangle.
--- @param top integer # The top position of the rectangle.
--- @param right integer # The right position of the rectangle.
--- @param bottom integer # The bottom position of the rectangle.
--- @param radius integer # The radius of the corners.
--- @return boolean # Returns true if the round rectangle was drawn successfully.
function GAME_ENGINE:draw_round_rect(left, top, right, bottom, radius) end

--- Fills a round rectangle.
--- @param left integer # The left position of the rectangle.
--- @param top integer # The top position of the rectangle.
--- @param right integer # The right position of the rectangle.
--- @param bottom integer # The bottom position of the rectangle.
--- @param radius integer # The radius of the corners.
--- @return boolean # Returns true if the round rectangle was filled successfully.
function GAME_ENGINE:fill_round_rect(left, top, right, bottom, radius) end

--- Draws a line.
--- @param x1 integer # The x-coordinate of the starting point.
--- @param y1 integer # The y-coordinate of the starting point.
--- @param x2 integer # The x-coordinate of the ending point.
--- @param y2 integer # The y-coordinate of the ending point.
--- @return boolean # Returns true if the line was drawn successfully.
function GAME_ENGINE:draw_line(x1, y1, x2, y2) end

--- Draws an oval.
--- @param left integer # The left position of the oval.
--- @param top integer # The top position of the oval.
--- @param right integer # The right position of the oval.
--- @param bottom integer # The bottom position of the oval.
--- @return boolean # Returns true if the oval was drawn successfully.
function GAME_ENGINE:draw_oval(left, top, right, bottom) end

--- Fills an oval.
--- @param left integer # The left position of the oval.
--- @param top integer # The top position of the oval.
--- @param right integer # The right position of the oval.
--- @param bottom integer # The bottom position of the oval.
--- @param opacity integer # The opacity of the fill 0-255 (optional).
--- @return boolean # Returns true if the oval was filled successfully.
--- @overload fun(left: integer, top: integer, right: integer, bottom: integer): boolean
function GAME_ENGINE:fill_oval(left, top, right, bottom, opacity) end

--- Draws a rectangle.
--- @param left integer # The left position of the rectangle.
--- @param top integer # The top position of the rectangle.
--- @param right integer # The right position of the rectangle.
--- @param bottom integer # The bottom position of the rectangle.
--- @return boolean # Returns true if the rectangle was drawn successfully.
function GAME_ENGINE:draw_rect(left, top, right, bottom) end

--- Fills a rectangle.
--- @param left integer # The left position of the rectangle.
--- @param top integer # The top position of the rectangle.
--- @param right integer # The right position of the rectangle.
--- @param bottom integer # The bottom position of the rectangle.
--- @param opacity integer # The opacity of the fill 0-255 (optional).
--- @return boolean # Returns true if the rectangle was filled successfully.
--- @overload fun(left: integer, top: integer, right: integer, bottom: integer): boolean
function GAME_ENGINE:fill_rect(left, top, right, bottom, opacity) end

--- Draws an arc.
--- @param left integer # The left position of the arc.
--- @param top integer # The top position of the arc.
--- @param right integer # The right position of the arc.
--- @param bottom integer # The bottom position of the arc.
--- @param startDegree integer # The starting degree of the arc.
--- @param angle integer # The angle of the arc.
--- @return boolean # Returns true if the arc was drawn successfully.
function GAME_ENGINE:draw_arc(left, top, right, bottom, startDegree, angle) end

--- Fills an arc.
--- @param left integer # The left position of the arc.
--- @param top integer # The top position of the arc.
--- @param right integer # The right position of the arc.
--- @param bottom integer # The bottom position of the arc.
--- @param startDegree integer # The starting degree of the arc.
--- @param angle integer # The angle of the arc.
--- @return boolean # Returns true if the arc was filled successfully.
function GAME_ENGINE:fill_arc(left, top, right, bottom, startDegree, angle) end

--- Draws a string within a specified rectangle.
--- @param text string # The text to draw.
--- @param left integer # The left coordinate of the bounding rectangle.
--- @param top integer # The top coordinate of the bounding rectangle.
--- @param right integer # The right coordinate of the bounding rectangle.
--- @param bottom integer # The bottom coordinate of the bounding rectangle.
--- @return integer # Returns the number of characters drawn.
--- @overload fun(text: string, left: integer, top: integer): integer
function GAME_ENGINE:draw_string(text, left, top, right, bottom) end

--- Draws a polygon.
--- @param points table # An array of points defining the polygon.
--- @param count integer # The number of points in the array.
--- @return boolean # Returns true if the polygon was drawn successfully.
function GAME_ENGINE:draw_polygon(points, count) end

--- Fills a polygon.
--- @param points table # An array of points defining the polygon.
--- @param count integer # The number of points in the array.
--- @return boolean # Returns true if the polygon was filled successfully.
function GAME_ENGINE:fill_polygon(points, count) end

--- Sets the brush color
--- @param r integer # The red component of the color (0-255)
--- @param g integer # The green component of the color (0-255)
--- @param b integer # The blue component of the color (0-255)
--- @return nil
function GAME_ENGINE:set_color(r, g, b) end

--- Checks if key is down
--- @param key string # The key to check
--- @return boolean # Returns true if the key is down
function GAME_ENGINE:key_down(key) end

--- Sets the list of keys to be checked
--- @param keys string # The list of keys to be checked
--- @return nil
function GAME_ENGINE:set_key_list(keys) end
