extends Node2D

var currentScene = null

var globals = {}

func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)
	
func set_scene(scene):
	if (currentScene != null): currentScene.queue_free()
	var new_scene = load(scene)
	currentScene = new_scene.instance()
	get_tree().get_root().add_child(currentScene)
	
func get_prop(key):
	return globals[key]
	
func set_prop(key, value):
	globals[key] = value
