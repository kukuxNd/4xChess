extends Node2D

var target_pos = Vector2.ZERO  # 目标位置
var speed = 320.0  # 移动速度
var can_move = false  # 标志变量 - 能否移动
var alive = true

@export var hp = 3
@export var defened = 3
@export var attack = 3

func _ready():
	GameGlobal.curActor = self
	set_process(false)  # 停止_process的执行

func _input(event):
	return
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			target_pos = get_global_mouse_position()  # 记录点击的鼠标位置
			can_move = true  # 允许向目标移动
			set_process(true)  # 启动_process的执行

func _process(delta):
	if can_move:
		if global_position.distance_to(target_pos) > 1:
			global_position = global_position.move_toward(target_pos, speed * delta)
		else:
			can_move = false  # 停止向目标移动
			set_process(false)  # 停止_process的执行
			call_deferred("set_alive", false)
			

func move_to(pos):
	if !alive:
		return
		
	can_move = true
	target_pos = pos
	set_process(true)
	pass

func set_alive(_alive):
	can_move = _alive
	alive = _alive
	$hero_show.use_parent_material = !_alive