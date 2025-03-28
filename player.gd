extends Area2D

const SPEED = 400
var screen_size
var max_recoil = 15
var recoil = max_recoil
var invincible = false
@export var bullet: PackedScene

signal health_changed
var health := 3

func _ready():
	screen_size = get_viewport_rect().size
	$HealthBar2D.initialize("health_changed", health)

func shoot():
	if recoil < 0:
		var inst = bullet.instantiate()
		
		inst.position = position
		inst.position.x += 15
		get_parent().add_child(inst)
		recoil = max_recoil

func _process(delta):
	var input = Vector2()
	
	input.x += float(Input.is_key_pressed(KEY_D))
	input.x -= float(Input.is_key_pressed(KEY_A))
	input.y -= float(Input.is_key_pressed(KEY_W))
	input.y += float(Input.is_key_pressed(KEY_S))
	recoil -= delta * 60
	
	if Input.is_key_pressed(KEY_SPACE):
		shoot()
	if input.length() != 0:
		input = input.normalized()
	position += input * SPEED * delta

func on_signal_cross_end():
	if invincible == false:
		health -= 1
		invincible = true
		$Timer.start()
		emit_signal("health_changed", health)
func _on_area_entered(area):
	on_signal_cross_end()
func _on_timer_timeout():
	invincible = false
