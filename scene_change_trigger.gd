extends Area2D

@export var hallmark_checker: String = "res://hallmark_checker.tscn"  # Ensure this is the correct path

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Player":  # Ensure it's detecting the Player node	
		call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file(hallmark_checker)
