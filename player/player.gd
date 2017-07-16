extends RigidBody2D

const SIDE_FORCE = 20.0
const JUMP_SPEED = 400.0

var ground_ray_left
var ground_ray_right
var head_ray

func _ready():
	set_process(true)
	set_process_input(true)
	
	ground_ray_left = get_node("ground_ray_left")
	ground_ray_right = get_node("ground_ray_right")
	head_ray = get_node("head_ray")

func _input(event):
	if event.is_action_pressed("move_up") and (ground_ray_left.is_colliding() or ground_ray_right.is_colliding()):
		var vel = get_linear_velocity()
		vel.y = -JUMP_SPEED
		set_axis_velocity(vel)

func _process(delta):
	
	if Input.is_action_pressed("move_left"):
		apply_impulse(Vector2(0,0), Vector2(-SIDE_FORCE,0))
	if Input.is_action_pressed("move_right"):
		apply_impulse(Vector2(0,0), Vector2(SIDE_FORCE,0))
		
	if head_ray.is_colliding():
		print("YOU HIT YOUR HEAD!")

