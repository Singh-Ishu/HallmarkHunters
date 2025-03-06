extends TextureRect

@onready var close_button = $CloseButton

func _ready():
	visible = true  # Show on start
	close_button.pressed.connect(_on_close_button_pressed)

func _on_close_button_pressed():
	visible = false  # Hide when clicked
