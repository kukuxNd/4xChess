extends CanvasLayer

signal return_main_menu

var main 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_tree().get_current_scene()
	pass # Replace with function body.

# 开始游戏
func _on_btn_start_pressed() -> void:
	GameGlobal._sg_game_start_.emit()
	$UI_Start.hide()
	$UI_Game.show()
	pass # Replace with function body.

# 退出游戏
func _on_btn_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


# 回到主菜单
func _on_btn_return_main_pressed() -> void:
	$UI_Game.hide()
	$UI_Start.show()
	return_main_menu.emit()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
