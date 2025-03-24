extends Area2D

const SPEED = 250
var velocity

signal health_changed
var health := 20

signal cross_end

func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	var type = randi() % mob_types.size()
	$AnimatedSprite2D.play(mob_types[type])
	
	velocity = Vector2(-SPEED * [1.25, 1, 0.75][type], 0)
	health = 20 * [0.75, 1, 1.25][type]
	$HealthBar2D.max_value = health
	$HealthBar2D.initialize("health_changed", health)

func _process(delta):
	position += velocity * delta
	if position.x < -100:
		cross_end.emit()
		queue_free()

func take_dmg(dmg):
	health -= dmg
	emit_signal("health_changed", health)
	if health <= 0:
		get_node("../Label").add_score(100)
		queue_free()
