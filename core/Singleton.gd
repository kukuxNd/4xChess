extends Node
class_name Singleton

static var ins = null

func _ready():
    if ins == null:
        ins = self