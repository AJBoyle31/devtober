extends Node2D

var button_pressed = false

onready var transition_rect = $SceneTransitionRect

func _process(_delta):
	if button_pressed:
		$CanvasLayer/ColorRect/VBoxContainer/AnimatedSprite.position.x += 5
	



func _on_Button_pressed():
	$DelayTimer.start()
	button_pressed = true
	$CanvasLayer/ColorRect/VBoxContainer/AnimatedSprite.play("run")
	

func _on_DelayTimer_timeout():
	transition_rect.transition_to("res://Levels/TestLevel.tscn")
