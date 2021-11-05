extends Node2D



var CandyCollectedEffect = preload("res://Effects/CandyCollectedEffect.tscn")

export (String, "blue", "green", "orange", "pink", "purple", "red", "white", "yellow") var bean_color


var beans = ["res://Assets/Items/Candy/bean_blue.png","res://Assets/Items/Candy/bean_green.png","res://Assets/Items/Candy/bean_orange.png","res://Assets/Items/Candy/bean_pink.png","res://Assets/Items/Candy/bean_purple.png","res://Assets/Items/Candy/bean_red.png","res://Assets/Items/Candy/bean_white.png","res://Assets/Items/Candy/bean_yellow.png"]

var effect_color = ""

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite

func _ready():
	animationPlayer.play("animate")
	sprite.texture = load("res://Assets/Items/Candy/bean_" + bean_color + ".png")
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
