extends AnimationPlayer

var dinos = []
var state

enum animations {
	IDLE,
	RUN,
	KICK,
	SNEAK,
	HURT,
	JUMP,
	FALL
}


func _ready():
	play("idle")


func update_animation(_move_vec: Vector2, _velocity: Vector2, _kicking: bool):
	if _kicking:
		state = animations.KICK
	elif _velocity.y > 0.01:
		state = animations.FALL
	elif _velocity.y < -0.01:
		state = animations.JUMP
	elif _move_vec.x > 0.01 or _move_vec.x < -0.01:
		state = animations.RUN
	else:
		state = animations.IDLE
	
	match state:
		animations.RUN:
			play("run")
		animations.IDLE:
			play("idle")
		animations.SNEAK:
			play("sneak")
		animations.HURT:
			play("hurt")
		animations.KICK:
			play("kick")
		animations.JUMP:
			play("jump")
		animations.FALL:
			play("fall")

