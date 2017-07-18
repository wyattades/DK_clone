extends Panel

const JITTER_TIME = 1.0

var axis

func _ready():
	axis = get_node("axis")
	
	var timer = Timer.new()
	timer.set_wait_time(JITTER_TIME)
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	axis.set_rot(axis.get_rot() * -1)