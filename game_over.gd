extends Control

@onready var reason_label = $ReasonLabel
@onready var retry_button = $RetryButton

func _ready():
	reason_label.text = GameManager.failure_reason  # Retrieve the failure reason
