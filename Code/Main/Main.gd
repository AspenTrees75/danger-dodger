extends Node
class_name Main

@onready var quit_button: Button = $"Pause Menu/VBox/QuitButton"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quit_button.pressed.connect(on_quit_pressed)

func on_quit_pressed():
	get_tree().quit()
	
