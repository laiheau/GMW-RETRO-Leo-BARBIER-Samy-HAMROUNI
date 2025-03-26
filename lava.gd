extends Node2D
@onready var zone: CollisionShape2D = $Area2D/zone

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	zone.shape.extents.y += 10 * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		body.health -= 10 if body.health - 10 >= 0 else 0
