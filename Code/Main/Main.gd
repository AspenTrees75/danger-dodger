extends Node
class_name Main

#level files
const TRAFFIC_TIME = preload("res://Levels/TrafficTime.tscn")
const WATER_WORLD = preload("res://Levels/WaterWorld.tscn")
const SKY_WORLD = preload("res://Levels/SkyWorld.tscn")

@onready var pause_menu: PauseMenu = $"Pause Menu"

var levels: Array[Level] = [TRAFFIC_TIME, WATER_WORLD, SKY_WORLD0]
var current_level = -1
var level: Level = null

func _ready() -> void:
	next_level()
	#level = TRAFFIC_TIME.instantiate()
	#level.main = self
	#add_child(level)
	
func next_level():
	if level != null:
		level.queue_free()
	
	current_level += 1
	if current_level > levels.size() - 1:
		current_level = 0
	
	level = levels[current_level].instantiate()
	level.main = self
	add_child(level)
