
extends Node2D

func _ready():
	if global.win == 0:
		get_node("txt").set_text("draw")
	elif global.win == 1:
		get_node("txt").set_text("Red Win")
	elif global.win == 2:
		get_node("txt").set_text("Blue Win")


