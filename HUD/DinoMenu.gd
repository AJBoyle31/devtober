extends PopupMenu



onready var data = $"/root/Data"



func _on_Blue_pressed():
	data.dino_color = "blue"
	hide()

func _on_Red_pressed():
	data.dino_color = "red"
	hide()

func _on_Green_pressed():
	data.dino_color = "green"
	hide()

func _on_Yellow_pressed():
	data.dino_color = "yellow"
	hide()
