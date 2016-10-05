
extends Node2D

func _ready():
	global.clear_figures()
	
	if global.win == 0:
		get_node("txt").set_text("Draw")
	elif global.win == 1:
		get_node("txt").set_text("Red Win")
	elif global.win == 2:
		get_node("txt").set_text("Blue Win")
		
	global.reset_values()

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")
