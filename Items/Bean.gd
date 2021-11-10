extends Item


export (String, "blue", "green", "orange", "pink", "purple", "red", "white", "yellow") var bean_color


func _ready():
	item_color = bean_color
	sprite.texture = load("res://Assets/Items/Candy/bean_" + bean_color + ".png")


