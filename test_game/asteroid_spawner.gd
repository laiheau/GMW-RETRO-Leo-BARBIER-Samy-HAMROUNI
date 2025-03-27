extends Node2D

@export var asteroid_scene: PackedScene
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	_on_asteroid_spawn_timeout()

func _on_asteroid_spawn_timeout():
	var asteroid = asteroid_scene.instantiate()
	
	asteroid.position = Vector2(screen_size.x + 100, randf_range(100, screen_size.y - 100))
	
	add_child(asteroid)
