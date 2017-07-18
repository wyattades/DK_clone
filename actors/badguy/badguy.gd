extends Node2D

const I_SPEED = 400

var barrel = preload("res://objects/barrel.tscn")

func _ready():
	var timer = Timer.new()
	timer.set_wait_time(0.5)
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	var _barrel = barrel.instance()
	var side_speed = I_SPEED if rand_range(0,1)<0.5 else -I_SPEED
	_barrel.set_linear_velocity(Vector2(side_speed, -I_SPEED))
	_barrel.set_pos(get_pos())
	get_parent().add_child(_barrel)