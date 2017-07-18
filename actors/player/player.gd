extends "res://actors/character.gd"

var grounded
var friction

func _ready():
	move_acc = 50
	max_move_speed = 400
	jump_speed = 700
	
	grounded = false
	friction = get_friction()

func apply_force(state):
	if (Input.is_action_pressed("move_left")): 
		directional_force += DIRECTION.LEFT
	if (Input.is_action_pressed("move_right")): 
		directional_force += DIRECTION.RIGHT
	if (Input.is_action_pressed("move_up") and grounded): 
		directional_force += DIRECTION.UP

func _on_bottom_check_body_enter(body):
	var groups = body.get_groups()
	if (groups.has("solid")):
		grounded = true
		set_friction(friction)
	if (groups.has("badguy")): # you win!
		get_node("/root/globals").set_scene("res://gui/game_win.tscn")

func _on_bottom_check_body_exit(body):
	var groups = body.get_groups()
	if (groups.has("solid")):
		grounded = false
		set_friction(0.0)

# Check if hit barrels
func _on_top_check_body_enter(body):
	var groups = body.get_groups()
	if (groups.has("danger")): # game over
		get_node("/root/globals").set_scene("res://gui/game_lose.tscn")

# Check if hit danger_zone
func _on_bottom_check_area_enter(area):
	var groups = area.get_groups()
	if (groups.has("danger")): # game over
		get_node("/root/globals").set_scene("res://gui/game_lose.tscn")
