extends Button

func _ready():
	self.pressed.connect(_on_retry_pressed)

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://map.tscn")  # Adjust to your start scene
