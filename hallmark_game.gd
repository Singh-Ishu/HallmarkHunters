extends Control

@onready var hallmark_display = $HallmarkDisplay  # Adjust path if needed
@onready var real_button = $RealButton
@onready var fake_button = $FakeButton

@export var real_images: Array[Texture2D]  # List of real hallmark images
@export var fake_images: Array[Texture2D]  # List of fake hallmark images
@export var start_screen: String = "res://map.tscn"  # Path to start screen

var current_image: Texture2D  # Stores the current image
var is_real: bool  # True if the image is from real_images, false if from fake_images

func _ready():
	pick_random_hallmark()
	real_button.pressed.connect(_on_real_button_pressed)
	fake_button.pressed.connect(_on_fake_button_pressed)
	update_image()  # Ensure the first image is shown

func pick_random_hallmark():
	if randi() % 2 == 0 and real_images.size() > 0:
		current_image = real_images.pick_random()
		is_real = true
	elif fake_images.size() > 0:
		current_image = fake_images.pick_random()
		is_real = false
	else:
		print("No images available!")
		return

	update_image()  # Update image properly

func update_image():
	if current_image:
		hallmark_display.texture = current_image
		print("Image updated:", current_image)
	else:
		print("No image selected!")

func _on_real_button_pressed():
	if is_real:
		pick_random_hallmark()  # Correct choice → Next image
	else:
		get_tree().change_scene_to_file(start_screen)  # Wrong → Back to start

func _on_fake_button_pressed():
	if !is_real:
		pick_random_hallmark()  # Correct choice → Next image
	else:
		get_tree().change_scene_to_file(start_screen)  # Wrong → Back to start
