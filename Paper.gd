extends Area2D

var object_type = "paper"
var PaperScene = preload("res://Paper.tscn")
var speed = randf_range(50,300)
var velocity = Vector2()

func _ready():
	velocity = Vector2(randf() - 0.5, randf() - 0.5).normalized() * speed

func _process(delta):
	var new_position = position + velocity * delta
	if new_position.x < 0 or new_position.x > get_viewport_rect().size.x:
		velocity.x *= -1
	if new_position.y < 0 or new_position.y > get_viewport_rect().size.y:
		velocity.y *= -1
	position = position + velocity * delta


func _on_Paper_area_entered(area):
	if area.object_type == "rock":
		area.queue_free()
		var new_paper_instance = PaperScene.instantiate()
		new_paper_instance.position = area.position
		get_parent().add_child(new_paper_instance)
