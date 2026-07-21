extends PanelContainer
class_name PauseMenu

@onready var title: Label = $VBox/Title
@onready var play_button: Button = $VBox/PlayButton
@onready var quit_button: Button = $VBox/QuitButton


func _ready() -> void:
	play_button.pressed.connect(on_play_button_pressed)
	quit_button.pressed.connect(on_quit_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func toggle_pause():
	# Fixme: not finished
	if get_tree().paused:
		pause_menu.hide()
		get_tree().paused = false
	else:
		.show()
		get_tree().paused = true	

func on_play_button_pressed():
	get_tree().paused = false
	hide()
	
func on_quit_button_pressed():
	get_tree().quit()
