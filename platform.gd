extends Node2D
@export var dimension = DIMS.DAY
@onready var hitbox: CollisionShape2D = $StaticBody2D2/hitbox
enum DIMS {DAY, NIGHT}
var player = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_nodes_in_group("Player")
	player = player[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.currentDim == dimension:
		hitbox.debug_color.a8 = 255
		hitbox.disabled = false
	else:
		hitbox.debug_color.a8 = 50
		hitbox.disabled = true
