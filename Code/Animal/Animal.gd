extends Area3D
class_name Animal ## Main class of player character

@onready var graphics: Node3D = $Graphics
@onready var colider: CollisionShape3D = $Colider
@onready var lives_ui: Label = $UI/VBox/LivesUI




# lerp(a, b, 0.5)
#    16, 8, 0.5 = 4
# lerp(position, next_spot, 0.25)

@export var lives: int = 3 # lives remaining
var main: Main
var spawning_point: Vector3
var leap_distance: float = 1.0
#var weight: float = 1.0 # 0-1
#var weight_speed: float = 1.0 # per sec.

#var current_spot: Vector3
#var next_spot: Vector3


func _ready() -> void:
	#signal break
	area_entered.connect(on_entered)
	spawning_point = Vector3.ZERO
	
	#current_spot = position
	#next_spot = position
	main = get_parent()
	update_lives(0)
	

		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_left"):
		position.x -= leap_distance
		#next_spot = current_spot + Vector3.LEFT
		#weight = 0.0
		graphics.rotation_degrees.y = 90.0

	if Input.is_action_just_pressed("move_right"):
		position.x += leap_distance
		#next_spot = current_spot + Vector3.RIGHT
		#weight = 0.0
		graphics.rotation_degrees.y = -90.0
		
	if Input.is_action_just_pressed("move_up"):
		position.z -= leap_distance
		#next_spot = current_spot + Vector3.FORWARD
		#weight = 0.0
		graphics.rotation_degrees.y = 0.0
		
	if Input.is_action_just_pressed("move_down"):
		position.z += leap_distance
		#next_spot = current_spot + Vector3.BACK
		#weight = 0.0
		graphics.rotation_degrees.y = 180.0
	
	
	# Tweening
	#if weight < 1.0:
		#weight += weight_speed * delta
	# Resting
	#else:
		#weight = 1.0
		#current_spot = next_spot
		
	#print(weight)
	
	# Testing
	#next_spot = Vector3(1, 0 , 0)
	#position = lerp(current_spot, next_spot, weight)
	
	#if position == spawning_point:
		#graphics.show()
		#colider.disabled = false
func update_lives(delta_lives: int):
	lives += delta_lives
	lives_ui.text = "Lives Remaining: " + str(lives)
	
func respawn():
	#todo: subtract life, is game over, to spawning point, hide/show graphics
	
	#colider.set_deffered("disabled", true)
	#graphics.hide()
	#colider.disabled = true
	print("Respawning")
	position = spawning_point
	pass
	
	
func on_entered(other_area) -> void:
		if other_area is Goal:
			respawn()
			other_area.set_occupied()
			main.check_game_over()
			print("Goal!")
			
		if other_area is Vehicle:
			print("Lose a Life")
			update_lives(-1)
			respawn() 
			
	
		
		
	
	
	
	
	
	
