extends Control

@onready var hallmark_display = $HallmarkDisplay
@onready var real_button = $RealButton
@onready var fake_button = $FakeButton

@export var real_images: Array[Texture2D]  
@export var fake_images: Array[Texture2D]  
@export var start_screen: String = "res://map.tscn"  
@export var game_over_scene: String = "res://game_over.tscn"  

var current_image: Texture2D  
var is_real: bool  
var last_image: Texture2D  # Store the last shown image

func _ready():
	pick_random_hallmark()
	real_button.pressed.connect(_on_real_button_pressed)
	fake_button.pressed.connect(_on_fake_button_pressed)

func pick_random_hallmark():
	var available_real = real_images.duplicate()
	var available_fake = fake_images.duplicate()

	# Remove last image from available options
	available_real.erase(last_image)
	available_fake.erase(last_image)

	var chosen_images = available_real if randi() % 2 == 0 and available_real.size() > 0 else available_fake

	if chosen_images.size() > 0:
		current_image = chosen_images.pick_random()
		is_real = current_image in real_images
		last_image = current_image  # Store the last image
		hallmark_display.texture = current_image
	else:
		print("No valid images available!")

func _on_real_button_pressed():
	if is_real:
		pick_random_hallmark()
	else:
		goto_game_over("You marked fake jewelry as real!")

func _on_fake_button_pressed():
	if !is_real:
		pick_random_hallmark()
	else:
		goto_game_over("You marked real jewelry as fake!")

func goto_game_over(reason: String):
	GameManager.failure_reason = reason  # Store the failure reason
	get_tree().change_scene_to_file(game_over_scene)
