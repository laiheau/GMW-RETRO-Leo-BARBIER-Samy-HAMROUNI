extends Node2D

@export var mob_scene: PackedScene
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _on_mob_spawn_timeout():
	var mob = mob_scene.instantiate()
	
	mob.position = Vector2(screen_size.x + 100, randf_range(100, screen_size.y - 100))
	mob.connect("cross_end", get_node("../Player").on_signal_cross_end)
	
	add_child(mob)
