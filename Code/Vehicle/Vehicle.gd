extends Area3D
class_name Vehicle

var speed = 3.0 #mps
# limit of travel
var kill_distance: float = 10.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.z += speed * delta # forward
	if position.z > kill_distance:
		position.z = -kill_distance
   	
 
