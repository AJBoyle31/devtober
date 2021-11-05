extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(_delta):
	if Input.is_action_just_pressed("restart"):
		$PauseMenu.show()
		get_tree().paused = true


func _on_CloseButton_pressed():
	$PauseMenu.hide()
	get_tree().paused = false


func _on_ChoosePlayerButton_pressed():
	pass # Replace with function body.


func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
