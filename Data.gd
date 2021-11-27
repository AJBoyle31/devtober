extends Node

var total_score: int = 0
var high_score: int = 0
var score = 0 setget update_score
var dino_color = "blue" setget update_dino_color

signal change_dino_color
signal change_score

func _ready():
	#print(total_score)
	total_score = 0
	update_score(total_score)


func update_dino_color(_color):
	emit_signal("change_dino_color", _color)


func update_score(_score):
	total_score += _score
	emit_signal("change_score", total_score)
