extends Area2D

enum DIMS {DAY, NIGHT}
@export var dimension: DIMS = DIMS.DAY
var collide_with_player = false


func _ready() -> void:
	get_node("../CanvasLayer/ShaderRect").dimension_changed.connect(_on_shader_rect_dimension_changed)
	if self.dimension == DIMS.DAY:
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.play("hidden")

func _process(delta: float) -> void:
	if self.collide_with_player and $AnimatedSprite2D.animation != "hidden":
		self.queue_free()



func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		collide_with_player = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		collide_with_player = false


func _on_shader_rect_dimension_changed(dimension) -> void:
	if self.dimension == dimension :
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.play("hidden")
