extends Node2D

@export var grid:PackedScene
var screen_width
var screen_height
var start_pos_x
var start_pos_y
var col_x = 3
var col_y = 3
var GRID_WIDTH = 33
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("map start!")
	screen_width = get_viewport_rect().size.x
	screen_height = get_viewport_rect().size.y
	start_pos_x = - GRID_WIDTH
	start_pos_y = - GRID_WIDTH
	drwaMap()
	pass # Replace with function body.

func drwaMap()->void:
	
	# 画一个就3*3的格子地图
	for x in range(3):
		for y in range(3):
			# 画一个格子
			var node = grid.instantiate()
			node.position = Vector2(start_pos_x+x*GRID_WIDTH,start_pos_y+y*GRID_WIDTH)
			add_child(node)
			pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
