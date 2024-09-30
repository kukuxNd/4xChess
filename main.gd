extends Node


var config = load("res://json/config.tres")
func test_json() -> void:
	print(config.data.entities)
	for one in config.data.entities:
		print(one.name)
	
	pass

func onGameStart() -> void:
	print("onGameStart")
	GameGlobal.gameState = GameGlobal.GameState.STARTING
	$"%Map".onStart()
	pass
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

		
	config.get_class()
	$HUB.return_main_menu.connect(_on_return_main_menu)
	
	pass # Replace with function body.

func _on_return_main_menu() -> void:
	GameGlobal.gameState = GameGlobal.GameState.MAIN_MENU
	$"%Map".onStop()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#触发下一回合
func _on_btn_next_turn_pressed() -> void:
	GameGlobal.global_info["turnCount"] += 1
	var global_info = GameGlobal.global_info
	GameGlobal.curActor.set_alive(true)
	#GameGlobal.freshScoreText()
	#%TipScoreText.text = "123"
	%TipScoreText.text = "点数：" + str(global_info["money"]) + " 积分："+ str(global_info["score"]) + " 回合："+ str(global_info["turnCount"])
	pass # Replace with function body.


