extends Node2D

var scene = preload("res://gui/main_menu.tscn")

func _ready():
	add_child(scene.instance())
	
