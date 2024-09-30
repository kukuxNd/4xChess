extends Node2D

@export var mod_scene: PackedScene
var map_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await GameGlobal._sg_game_start_
	onStart()
	pass # Replace with function body.

func onStart() -> void:
	#print("map Start")
	map_scene = mod_scene.instantiate()

	add_child(map_scene)
	pass

func onStop() -> void:
	print("map Stop")
	if map_scene != null:
		map_scene.queue_free()
	pass	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
