extends Panel

var playScene = preload("res://levels/level.tscn")

var rot
var axis
var button

func _ready():
	button = get_node("StartButton")
	axis = get_node("Axis")
	rot = axis.get_rot()
	
	button.connect("pressed", self, "_start_button_pressed")
	
	var timer = Timer.new()
	timer.set_wait_time(1.2)
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	rot *= -1
	axis.set_rot(rot)

func _start_button_pressed():
	get_tree().change_scene("res://levels/level.tscn")
