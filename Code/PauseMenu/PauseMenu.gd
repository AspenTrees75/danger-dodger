extends PanelContainer
class_name PauseMenu
## RootNode is Processing: "Always"


@onready var title: Label = $VBox/Title
@onready var play_button: Button = $VBox/PlayButton
@onready var quit_button: Button = $VBox/QuitButton


func _ready() -> void:
	hide() # fixme: how do we wish to begin?
	play_button.pressed.connect(on_play_button_pressed)
	quit_button.pressed.connect(on_quit_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
	
	
func toggle_pause():
	# Fixme: not finished
	title.text = "Paused"
	if get_tree().paused:
		hide()
		get_tree().paused = false
	else:
		show()
		get_tree().paused = true	

func game_over(message: String):
	title.text = message
	play_button.text = "Play Again?"
	show()

#Callback functions
func on_play_button_pressed():
	get_tree().paused = false
	hide()
	
func on_quit_button_pressed():
	get_tree().quit()
