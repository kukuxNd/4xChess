extends Node

	


func onGameStart() -> void:
	print("onGameStart")
	GameGlobal.gameState = GameGlobal.GameState.STARTING
	$"%Map".onStart()
	pass
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUB.return_main_menu.connect(_on_return_main_menu)
	pass # Replace with function body.

func _on_return_main_menu() -> void:
	GameGlobal.gameState = GameGlobal.GameState.MAIN_MENU
	$"%Map".onStop()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_next_turn_pressed() -> void:
	GameGlobal.global_info["turnCount"] += 1
	var global_info = GameGlobal.global_info
	#GameGlobal.freshScoreText()
	#%TipScoreText.text = "123"
	%TipScoreText.text = "点数：" + str(global_info["money"]) + " 积分："+ str(global_info["score"]) + " 回合："+ str(global_info["turnCount"])
	pass # Replace with function body.


