extends CanvasLayer




onready var pause_menu = $PauseMenu
onready var dino_color_menu = $DinoMenu
onready var score = $ScoreLabel



func _ready():
	update_score(0)
	Data.connect("change_score", self, "update_score")



func _process(_delta):
	if Input.is_action_just_pressed("restart"):
		pause_menu.show()
		get_tree().paused = true


func close_all_menus():
	pause_menu.hide()
	dino_color_menu.hide()
	get_tree().paused = false

func update_score(_score):
	score.text = "Score: " + str(_score)


func _on_CloseButton_pressed():
	close_all_menus()


func _on_ChoosePlayerButton_pressed():
	pause_menu.hide()
	dino_color_menu.show()


func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false


func _on_Blue_pressed():
	Data.dino_color = "blue"
	close_all_menus()


func _on_Red_pressed():
	Data.dino_color = "red"
	close_all_menus()

func _on_Green_pressed():
	Data.dino_color = "green"
	close_all_menus()

func _on_Yellow_pressed():
	Data.dino_color = "yellow"
	close_all_menus()







