extends "./menu.gd"

func _on_main_button_pressed():
	get_node("/root/globals").set_scene("res://levels/level.tscn")
