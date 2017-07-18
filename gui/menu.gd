extends Panel

var axis

func _ready():
	axis = get_node("axis")
	
	var timer = Timer.new()
	timer.set_wait_time(1.2)
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	axis.set_rot(axis.get_rot() * -1)