extends Node2D


const DiamondDisappearingEffect = preload("res://Effects/DiamondDisappearingEffect.tscn")

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite

func _ready():
	sprite.frame = 0
	animationPlayer.play("rise")


func make_diamond_disappear_effect():
	var diamondEffect = DiamondDisappearingEffect.instance()
	get_parent().add_child(diamondEffect)
	diamondEffect.global_position = Vector2(global_position.x - 5, global_position.y - 35)
	queue_free()



func _on_AnimationPlayer_animation_finished(_anim_name):
	if _anim_name == "rise":
		animationPlayer.play("idle")


func _on_Hurtbox_area_entered(_area):
	#print(_area.name)
	if _area.name == "PlayerHitbox":
		make_diamond_disappear_effect()
	



