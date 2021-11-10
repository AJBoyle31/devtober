extends Item


export (String, "blue", "green", "orange", "pink", "purple", "red", "teal", "yellow") var swirl_color



func _ready():
	if swirl_color == "":
		swirl_color = "blue"
	item_color = swirl_color
	sprite.texture = load("res://Assets/Items/Candy/swirl_" + swirl_color + ".png")
	

