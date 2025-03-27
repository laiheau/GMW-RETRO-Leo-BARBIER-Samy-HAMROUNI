extends Area2D

@export_enum("Dimension 1", "Dimension 2") var dimension: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if $AnimatedSprite2D.animation == "hidden":
		return
	if body.name == "Player":
		self.queue_free()

func _on_shader_rect_dimension_changed(dimension) -> void:
	if self.dimension == dimension :
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.play("hidden")
