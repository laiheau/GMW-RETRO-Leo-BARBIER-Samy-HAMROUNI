extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if get_tree().get_node_count_in_group("button") == 0:
		$AnimatedSprite2D.play("open")
