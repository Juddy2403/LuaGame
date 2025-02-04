//-----------------------------------------------------------------
// Game Engine WinMain Function
// C++ Source - GameWinMain.cpp - version v8_01
//-----------------------------------------------------------------

//-----------------------------------------------------------------
// Include Files
//-----------------------------------------------------------------
#include "GameWinMain.h"
#include "GameEngine.h"

#include "LuaGame.h"
//-----------------------------------------------------------------
// Create GAME_ENGINE global (singleton) object and pointer
//-----------------------------------------------------------------
GameEngine myGameEngine;
GameEngine* GAME_ENGINE{ &myGameEngine };

// Creating a second window for the console (debugging purposes)
void AllocateConsole()
{
	if (AllocConsole())                          // Allocate a new console for the application
	{
		FILE *fp;                                // Redirect STDOUT to the console
		freopen_s(&fp, "CONOUT$", "w", stdout);
		setvbuf(stdout, NULL, _IONBF, 0);        // Disable buffering for stdout

		freopen_s(&fp, "CONOUT$", "w", stderr);  // Redirect STDERR to the console
		setvbuf(stderr, NULL, _IONBF, 0);        // Disable buffering for stderr

		freopen_s(&fp, "CONIN$", "r", stdin);    // Redirect STDIN to the console
		setvbuf(stdin, NULL, _IONBF, 0);         // Disable buffering for stdin

		std::ios::sync_with_stdio(true);         // Sync C++ streams with the console
	}
}

//-----------------------------------------------------------------
// Main Function
//-----------------------------------------------------------------
int APIENTRY wWinMain(_In_ HINSTANCE hInstance, _In_opt_ HINSTANCE hPrevInstance, _In_ LPWSTR lpCmdLine, _In_ int nCmdShow)
{
	// Enable for debugging purposes
	//AllocateConsole();

	GAME_ENGINE->SetGame(new LuaGame());					// Set the game

	return GAME_ENGINE->Run(hInstance, nCmdShow);		// here we go

}

