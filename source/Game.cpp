//-----------------------------------------------------------------
// Main Game File
// C++ Source - Game.cpp - version v8_01
//-----------------------------------------------------------------

//-----------------------------------------------------------------
// Include Files
//-----------------------------------------------------------------
#include "Game.h"

#include "LuaBindings.h"

//-----------------------------------------------------------------
// Game Member Functions																				
//-----------------------------------------------------------------

Game::Game() 																	
{
	// nothing to create
	m_LuaState.set_exception_handler(&LuaBindings::ExceptionsHandler);
	m_LuaState.open_libraries(sol::lib::base, sol::lib::package, sol::lib::math, sol::lib::table, sol::lib::string);
	LuaBindings::RegisterBindings(m_LuaState);
	m_LuaState.script_file("luaFiles/game.lua");
}

Game::~Game()																						
{
	// nothing to destroy
}

void Game::Initialize()			
{
	// Code that needs to execute (once) at the start of the game, before the game window is created

	AbstractGame::Initialize();
	if (m_LuaState["initialize"].valid()) m_LuaState["initialize"]();
	else tcout<<_T("No initialize function found!")<<std::endl;

	// Set the keys that the game needs to listen to
	// tstringstream buffer;
	// buffer << _T("KLMO");
	// buffer << (char) VK_LEFT;
	// buffer << (char) VK_RIGHT;
	// GAME_ENGINE->SetKeyList(buffer.str());
}

void Game::Start()
{
	// Insert code that needs to execute (once) at the start of the game, after the game window is created
}

void Game::End()
{
	// Insert code that needs to execute when the game ends
}

void Game::Paint(RECT rect) const
{

	if (m_LuaState["paint"].valid()) m_LuaState["paint"](rect);
	else tcout<<_T("No paint function found!")<<std::endl;

	// Set the drawing color to white

	// Alternatively, fill a white circle with the specified coordinates
	//GAME_ENGINE->FillOval(150, 150, 300, 300,3);
	// POINT points[]= {
	// 	{  10,  10 },
	// 	{  50,  10 },
	// 	{  50,  50 },
	// 	{  10,  50 }
	// };

	//GAME_ENGINE->FillPolygon(points, 4);
}

void Game::Tick()
{
	if (m_LuaState["update"].valid()) m_LuaState["update"]();
	else tcout<<_T("No update function found!")<<std::endl;
	// Insert non-paint code that needs to execute each tick
}

void Game::MouseButtonAction(bool isLeft, bool isDown, int x, int y, WPARAM wParam)
{	
	// Insert code for a mouse button action
	if (m_LuaState["mouse_button_action"].valid()) m_LuaState["mouse_button_action"](isLeft, isDown, x, y);
	else tcout<<_T("No mouseButtonAction function found!")<<std::endl;
	/* Example:
	if (isLeft == true && isDown == true) // is it a left mouse click?
	{
		if ( x > 261 && x < 261 + 117 ) // check if click lies within x coordinates of choice
		{
			if ( y > 182 && y < 182 + 33 ) // check if click also lies within y coordinates of choice
			{
				GAME_ENGINE->MessageBox(_T("Clicked."));
			}
		}
	}
	*/
}

void Game::MouseWheelAction(int x, int y, int distance, WPARAM wParam)
{	
	if (m_LuaState["mouse_wheel_action"].valid()) m_LuaState["mouse_wheel_action"](x, y, distance);
	else tcout<<_T("No mouseWheelAction function found!")<<std::endl;
}

void Game::MouseMove(int x, int y, WPARAM wParam)
{	
	// Insert code that needs to execute when the mouse pointer moves across the game window
	if (m_LuaState["mouse_move"].valid()) m_LuaState["mouse_move"](x, y);
	else tcout<<_T("No mouseMove function found!")<<std::endl;
}

void Game::CheckKeyboard()
{	
	// Here you can check if a key is pressed down
	// Is executed once per frame 
	if (m_LuaState["check_keyboard"].valid()) m_LuaState["check_keyboard"]();
	else tcout<<_T("No checkKeyboard function found!")<<std::endl;
	/* Example:
	if (GAME_ENGINE->IsKeyDown(_T('K'))) xIcon -= xSpeed;
	if (GAME_ENGINE->IsKeyDown(_T('L'))) yIcon += xSpeed;
	if (GAME_ENGINE->IsKeyDown(_T('M'))) xIcon += xSpeed;
	if (GAME_ENGINE->IsKeyDown(_T('O'))) yIcon -= ySpeed;
	*/
}

void Game::KeyPressed(TCHAR key)
{	
	// DO NOT FORGET to use SetKeyList() !!

	// Insert code that needs to execute when a key is pressed
	// The function is executed when the key is *released*
	// You need to specify the list of keys with the SetKeyList() function

	if (m_LuaState["key_pressed"].valid()) {
		// Check if the key is a single character string
		if (key >= 0x08 && key <= 0xFF && !isalpha(key)) {
			m_LuaState["key_pressed"](static_cast<int>(key));
		} else {
			m_LuaState["key_pressed"](std::string(1, static_cast<char>(key)));
		}
	} else {
		tcout << _T("No keyPressed function found!") << std::endl;
	}
}

void Game::CallAction(Caller* callerPtr)
{
	// Insert the code that needs to execute when a Caller (= Button, TextBox, Timer, Audio) executes an action
}




