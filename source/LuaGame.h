//-----------------------------------------------------------------
// Main Game  File
// C++ Header - Game.h - version v8_01			
//-----------------------------------------------------------------

#pragma once

//-----------------------------------------------------------------
// Include Files
//-----------------------------------------------------------------

#include <sol/state.hpp>

#include "Resource.h"
#include "GameEngine.h"
#include "AbstractGame.h"

//-----------------------------------------------------------------
// Game Class																
//-----------------------------------------------------------------
class LuaGame : public AbstractGame, public Callable
{
public:				
	//---------------------------
	// Constructor(s) and Destructor
	//---------------------------
	LuaGame();

	virtual ~LuaGame() override;

	//---------------------------
	// Disabling copy/move constructors and assignment operators   
	//---------------------------
	LuaGame(const LuaGame& other)					= delete;
	LuaGame(LuaGame&& other) noexcept				= delete;
	LuaGame& operator=(const LuaGame& other)		= delete;
	LuaGame& operator=(LuaGame&& other) noexcept	= delete;

	//---------------------------
	// General Member Functions
	//---------------------------
	void Initialize			()															override;
	void Start				()															override;
	void End				()															override;
	void Paint				(RECT rect)	const											override;
	void Tick				()															override;
	void MouseButtonAction	(bool isLeft, bool isDown, int x, int y, WPARAM wParam)		override;
	void MouseWheelAction	(int x, int y, int distance, WPARAM wParam)					override;
	void MouseMove			(int x, int y, WPARAM wParam)								override;
	void CheckKeyboard		()															override;
	void KeyPressed			(TCHAR key)													override;
	
	void CallAction			(Caller* callerPtr)											override;

private:
	// -------------------------
	// Datamembers
	// -------------------------
	sol::state m_LuaState;

};
