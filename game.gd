extends Node2D

var RockScene = preload("res://Rock.tscn")
var PaperScene = preload("res://Paper.tscn")
var ScissorsScene = preload("res://Scissors.tscn")

func _ready():
	spawn_objects(RockScene, int(randf_range(8,16)))
	spawn_objects(PaperScene, int(randf_range(8,16)))
	spawn_objects(ScissorsScene, int(randf_range(8,16)))

func spawn_objects(scene, count):
	for i in range(count):
		var instance = scene.instantiate()
		instance.global_position = Vector2(randf_range(0, get_viewport_rect().size.x), randf_range(0, get_viewport_rect().size.y))
		add_child(instance)
