extends Control

@onready var letter_panel = $LetterPanel
@onready var letter_button = $LetterButton
@onready var close_button = $LetterPanel/CloseButton

func _ready():
	letter_panel.visible = false  # Initially hidden
	letter_button.pressed.connect(_on_letter_opened)
	close_button.pressed.connect(_on_letter_closed)

func _on_letter_opened():
	letter_panel.visible = true  # Show letter

func _on_letter_closed():
	letter_panel.visible = false  # Hide letter
