extends KinematicBody2D

export var SPEED: int = 150
const GRAVITY: int = 300
const JUMP: int = 200

var move_vec: Vector2 = Vector2.ZERO
var velocity: Vector2
var kicking: bool = false
var jumping: bool = false

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite


func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	
	move_vec.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	velocity.x = move_vec.x * SPEED
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jumping = true
		velocity.y = -JUMP
	
	if Input.is_action_just_pressed("kick") and is_on_floor() and !kicking:
		kicking = true
	
	velocity.y += GRAVITY * _delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
	flip_player(move_vec)
	animationPlayer.update_animation(move_vec, velocity, kicking)
	

func flip_player(_move_vec: Vector2):
	if _move_vec.x > 0.01:
		sprite.scale.x = 1
	elif _move_vec.x < -0.01:
		sprite.scale.x = -1



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "kick":
		kicking = false
