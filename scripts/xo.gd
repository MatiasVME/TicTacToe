
extends Node2D

var image = load("res://assets/img/o.png")

func change_o():
	get_node("figure").set_texture(image)

