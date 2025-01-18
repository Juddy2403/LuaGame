//-----------------------------------------------------------------
// Main Game File
// C++ Source - Game.cpp - version v8_01
//-----------------------------------------------------------------

//-----------------------------------------------------------------
// Include Files
//-----------------------------------------------------------------
#include "LuaGame.h"

#include "LuaBindings.h"

//-----------------------------------------------------------------
// Game Member Functions																				
//-----------------------------------------------------------------

LuaGame::LuaGame()
{
	// nothing to create
	m_LuaState.set_exception_handler(&LuaBindings::ExceptionsHandler);
	m_LuaState.open_libraries(sol::lib::base, sol::lib::package, sol::lib::math, sol::lib::table, sol::lib::string);
	LuaBindings::RegisterBindings(m_LuaState);
	m_LuaState.script_file("luaFiles/game.lua");
}

LuaGame::~LuaGame()
{
}

void LuaGame::Initialize()
{
	// Code that needs to execute (once) at the start of the game, before the game window is created

	AbstractGame::Initialize();
	if (m_LuaState["initialize"].valid()) m_LuaState["initialize"]();
	else tcout<<_T("No initialize function found!")<<std::endl;

}

void LuaGame::Start()
{
	if (m_LuaState["on_begin"].valid()) m_LuaState["on_begin"]();
	else tcout<<_T("No start function found!")<<std::endl;
}

void LuaGame::End()
{
	if (m_LuaState["on_end"].valid()) m_LuaState["on_end"]();
	else tcout<<_T("No end function found!")<<std::endl;
}

void LuaGame::Paint(RECT rect) const
{

	if (m_LuaState["paint"].valid()) m_LuaState["paint"](rect);
	else tcout<<_T("No paint function found!")<<std::endl;
}

void LuaGame::Tick()
{
	if (m_LuaState["update"].valid()) m_LuaState["update"]();
	else tcout<<_T("No update function found!")<<std::endl;
	// Insert non-paint code that needs to execute each tick
}

void LuaGame::MouseButtonAction(bool isLeft, bool isDown, int x, int y, WPARAM wParam)
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

void LuaGame::MouseWheelAction(int x, int y, int distance, WPARAM wParam)
{	
	if (m_LuaState["mouse_wheel_action"].valid()) m_LuaState["mouse_wheel_action"](x, y, distance);
	else tcout<<_T("No mouseWheelAction function found!")<<std::endl;
}

void LuaGame::MouseMove(int x, int y, WPARAM wParam)
{	
	// Insert code that needs to execute when the mouse pointer moves across the game window
	if (m_LuaState["mouse_move"].valid()) m_LuaState["mouse_move"](x, y);
	else tcout<<_T("No mouseMove function found!")<<std::endl;
}

void LuaGame::CheckKeyboard()
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

void LuaGame::KeyPressed(TCHAR key)
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

void LuaGame::CallAction(Caller* callerPtr)
{
}




