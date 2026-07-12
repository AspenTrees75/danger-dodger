extends Node3D
class_name Vehicle

var speed = 3.0 #mps

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * delta
	
