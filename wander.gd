extends Node2D

@export var group_name : String

var positions : Array
var temp_positions : Array
var current_position : Marker2D

var direction : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	positions = get_tree().get_nodes_in_group(group_name)
	get_positions()
	get_next_positions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if global_position.distance_to(current_position.position) < 10:
		get_next_positions()
	direction = to_local(current_position.position).normalized()

func get_positions():
	temp_positions = positions.duplicate()
	temp_positions.shuffle()

func get_next_positions():
	if temp_positions.is_empty():
		get_positions()
	current_position = temp_positions.pop_front()
	direction = to_local(current_position.position).normalized()
