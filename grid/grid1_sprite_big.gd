extends TextureRect

var bhover:bool = false
var bselect:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("mouse_entered", _on_mose_entered)
	connect("mouse_exited", _on_mose_exited)
	pass
	# connect("mouse_entered", "_on_Sprite_mouse_entered")
	# connect("mouse_exited", "_on_Sprite_mouse_exited")

func _on_mose_entered() -> void:
	bhover = true
	if bselect:
		return
	modulate = Color(0.3, 0.7, 1.0, 0.5)
	
	#print("mouse entered")

func _on_mose_exited() -> void:
	bhover = false
	if bselect:
		return
	modulate = Color(1.0, 1.0, 1.0, 1)	
	#print("mouse exited")
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed() and  bhover:
			modulate = Color(1.3, 0.7, 1.0, 0.9)
			bselect = !bselect
			modulate = Color(0.3, 0.5, .7, 0.9)  if bselect else Color(1.0, 1.0, 1.0, 1)
		#print(event)		
	# if bselect:
	# 	bselect = false
	# 	GameGlobal.target_pos = global_position
	# 	GameGlobal.actor_move()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:

# 	pass
