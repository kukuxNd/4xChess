extends Node

# 全局信号集 用于 await 等待型号
#下一回合
signal _sg_next_turn_
signal _sg_game_start_
signal _sg_game_pause_
signal _sg_game_over_
signal _sg_game_return_to_main_menu_


enum GameState{
	MAIN_MENU,
	STARTING,
	GAME_OVER,
}

var gameState:GameState

var global_info = {
	"game_state": GameState.MAIN_MENU,
	"score": 0,
	"money": 0,
	"turnCount": 0,
	"PlayerNum": 2,
}

var this_turn = 0

var target_pos

#当前行动者
var curActor

func actor_move() -> void:
	if curActor == null:
		return
	curActor.move_to(target_pos)


func freshScoreText() -> void:
	%TipScoreText.text = "点数：" + str(global_info["money"]) + " 积分："+ str(global_info["score"]) + " 回合："+ str(global_info["turnCount"])