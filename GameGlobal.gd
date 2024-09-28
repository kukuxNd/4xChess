extends Node


enum GameState{
	MAIN_MENU,
	STARTING,
	GAME_OVER,
}

var gameState:GameState

var global_settings = {
	"game_state": GameState.MAIN_MENU,
	"score": 0,
	"high_score": 0,
	"game_over_time": 0,
	"game_over_duration": 3,
}

