extends Node2D

var SPEED = randf_range(80, 120)
var ROTATION_SPEED = randf_range(30, 50)
var velocity
var rotation_velocity

func _ready():
	var type = randi_range(0, 2)
	var asteroid_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	
	velocity = Vector2(-SPEED, 0) * [1.25, 1, 0.75][type]
	rotation_velocity = ROTATION_SPEED * [1, 0.8, 0.6][type]
	rotation_degrees = randf_range(0, 360)
	
	$AnimatedSprite2D.play(asteroid_types[type])

func _process(delta):
	position += velocity * delta
	rotation_degrees -= ROTATION_SPEED * delta
