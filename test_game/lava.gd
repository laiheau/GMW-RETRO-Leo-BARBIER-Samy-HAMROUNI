extends Node2D
@onready var zone: CollisionShape2D = $Area2D/zone
@onready var player = get_node("../player")
var collide_with_player = false
const LAVA_DPS = 20
const LAVA_SPEED = 10

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	zone.shape.extents.y += LAVA_SPEED * delta
	if collide_with_player:
		player.health -= LAVA_DPS * delta if player.health - LAVA_DPS * delta >= 0 else 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		collide_with_player = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		collide_with_player = false
