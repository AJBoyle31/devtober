extends Node2D
class_name Level

onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	Data.total_score = 0

func _process(_delta):
	if player.global_position.y >= 600:
		get_tree().reload_current_scene()

