extends Area2D

@onready var transition = $"../Transition"  # Ensure this points to an AnimationPlayer
@export var hallmark_checker: String = "res://hallmark_checker.tscn"

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Player":
		call_deferred("change_scene")

func change_scene():
	transition.play("fade_out")  # Start fading out
	await transition.animation_finished  # Wait for fade-out to complete
	
	call_deferred("_perform_scene_change")  # Defer scene change to avoid tree deletion issue

func _perform_scene_change():
	get_tree().change_scene_to_file(hallmark_checker)  # Now change scene safely
