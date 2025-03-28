extends ColorRect

var green_filter = preload("res://green_filter.tres")
var blue_filter = preload("res://blue_filter.tres")
enum DIMS {DAY, NIGHT}
var currentDim = DIMS.DAY

signal dimension_changed(new_dimension)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switchDimension"):
		if currentDim == DIMS.DAY:
			currentDim = DIMS.NIGHT
			self.material = green_filter
		elif currentDim == DIMS.NIGHT:
			self.material = blue_filter
			currentDim = DIMS.DAY
		dimension_changed.emit(currentDim)
