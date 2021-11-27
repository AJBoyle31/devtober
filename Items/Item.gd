extends Node2D
class_name Item

var CandyCollectedEffect = preload("res://Effects/CandyCollectedEffect.tscn")

var item_color = ""
var effect_color = ""

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var stats = $Stats

func _ready():
	animationPlayer.play("animate")
	

func create_item_collected_effect():
	determine_effect_color()
	var candyEffect = CandyCollectedEffect.instance()
	candyEffect.color = effect_color
	get_parent().add_child(candyEffect)
	candyEffect.global_position = global_position
	queue_free()

func determine_effect_color() -> void:
	match item_color:
		"blue", "purple", "teal":
			effect_color = "blue"
		"green", "white":
			effect_color = "green"
		"red", "orange":
			effect_color = "red"
		"yellow", "pink":
			effect_color = "pink"



func _on_Hurtbox_area_entered(_area):
	create_item_collected_effect()
	Data.score += stats.points
