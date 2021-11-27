extends KinematicBody2D

const Diamond = preload("res://Items/Diamond.tscn")

onready var animatedSprite = $AnimatedSprite

func _ready():
	animatedSprite.play("closed")


func create_diamond():
	var diamond = Diamond.instance()
	get_parent().add_child(diamond)
	diamond.global_position = global_position
	#print("chest " + str(global_position))


func _on_ChestHurtbox_area_entered(_area):
	if animatedSprite.animation == "open":
			return
	if _area.name == "DinoKickHitbox":
		animatedSprite.play("open")
	


func _on_AnimatedSprite_animation_finished():
	if animatedSprite.animation == "open":
		create_diamond()
