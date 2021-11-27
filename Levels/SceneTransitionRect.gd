extends ColorRect

export(String, FILE, "*.tscn") var next_scene_path
export var not_intro: bool = true

onready var _anim_player: = $AnimationPlayer

func _ready():
	if not_intro:
		_anim_player.play_backwards("fade")


func transition_to(_next_scene := next_scene_path):
	_anim_player.play("fade")
	yield(_anim_player, "animation_finished")
	get_tree().change_scene(_next_scene)
