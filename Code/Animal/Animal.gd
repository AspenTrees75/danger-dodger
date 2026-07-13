extends Node3D
class_name Animal

@onready var graphics: Node3D = $Graphics

# lerp(a, b, 0.5)
#    16, 8, 0.5 = 4
# lerp(position, next_spot, 0.25)


var leap_distance: float = 1.0
var weight: float = 1.0 # 0-1
var weight_speed: float = 1.0 # per sec.

var current_spot: Vector3
var next_spot: Vector3


func _ready() -> void:
	current_spot = position
	next_spot = position



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_left"):
		#position.x -= leap_distance
		next_spot = current_spot + Vector3.LEFT
		weight = 0.0
		graphics.rotation_degrees.y = 90.0

	if Input.is_action_just_pressed("move_right"):
		#position.x += leap_distance
		next_spot = current_spot + Vector3.RIGHT
		weight = 0.0
		graphics.rotation_degrees.y = -90.0
		
	if Input.is_action_just_pressed("move_up"):
		#position.z -= leap_distance
		next_spot = current_spot + Vector3.FORWARD
		weight = 0.0
		graphics.rotation_degrees.y = 0.0
		
	if Input.is_action_just_pressed("move_down"):
		#position.z += leap_distance
		next_spot = current_spot + Vector3.BACK
		weight = 0.0
		graphics.rotation_degrees.y = 180.0
	
	
	
	# Tweening
	if weight < 1.0:
		weight += weight_speed * delta
	# Resting
	else:
		weight = 1.0
		
	print(weight)
	
	# Testing
	next_spot = Vector3(1, 0 , 0)
	position = lerp(current_spot, next_spot, weight)
	
	
	
	
	
	
	
	
