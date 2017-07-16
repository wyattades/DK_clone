extends Node2D

var player
var badguy

func _ready():
	set_process(true)
	player = get_node("player")
	badguy = get_node("badguy")

func _process(delta):
	if Input.is_action_pressed("move_left"):
		pass