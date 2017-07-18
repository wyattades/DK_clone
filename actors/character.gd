extends RigidBody2D

# Default character properties
var move_acc = 50
var max_move_speed = 200
var jump_speed = 400

# Movement vars
const DIRECTION = {
	ZERO = Vector2(0,0),
	LEFT = Vector2(-1.0, 0.0),
	RIGHT = Vector2(1.0, 0.0),
	UP = Vector2(0.0, -1.0),
	DOWN = Vector2(0.0, 1.0)
}

var directional_force = Vector2()

func _integrate_forces(state):
	
	directional_force = DIRECTION.ZERO
	
	apply_force(state)
	
	# Apply movement acceleration to velocity
	var vel = state.get_linear_velocity() + (directional_force * move_acc)
	
	# Constrain velocity by max speed
	if (vel.x > max_move_speed): vel.x = max_move_speed
	elif (vel.x < -max_move_speed): vel.x = -max_move_speed
	
	# Jump
	if (directional_force.y < 0): vel.y = -jump_speed
	
	# Apply velocity
	state.set_linear_velocity(vel)
	
# Override
func apply_force(state):
	pass



