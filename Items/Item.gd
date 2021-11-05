extends Node2D
class_name Item

var CandyCollectedEffect = preload("res://Effects/CandyCollectedEffect.tscn")

export (String, "blue", "green", "orange", "pink", "purple", "red", "white", "yellow") var bean_color

var effect_color = ""

func _ready():
	determine_effect_color()

func create_bean_collected_effect():
	var candyEffect = CandyCollectedEffect.instance()
	candyEffect.color = effect_color
	get_parent().add_child(candyEffect)
	candyEffect.global_position = global_position
	queue_free()

func determine_effect_color() -> void:
	match bean_color:
		"blue", "purple":
			effect_color = "blue"
		"green", "white":
			effect_color = "green"
		"red", "orange":
			effect_color = "red"
		"yellow", "pink":
			effect_color = "pink"


func _on_Hurtbox_area_entered(_area):
	create_bean_collected_effect()
