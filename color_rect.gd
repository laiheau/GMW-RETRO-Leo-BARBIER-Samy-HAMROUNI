extends ColorRect

var green_filter = preload("res://green_filter.tres")
var blue_filter = preload("res://blue_filter.tres")
var filter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switchDimension"):
		if filter == 0:
			filter = 1
			self.material = green_filter
		elif filter == 1:
			self.material = blue_filter
			filter = 0
