extends Node
class_name Main

@onready var pause_menu: PanelContainer = $"Pause Menu"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_menu.hide() #fixme
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
		
		

	

	
	
	
	
	
	
