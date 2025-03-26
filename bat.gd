extends CharacterBody2D
enum STATES {WANDERING, CHASING, ATTACKING}
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var wander: Node2D = $Wander

var target : CharacterBody2D
var attacking = false
var taking_damage = false
var damage = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("Idle")

func chase_player():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(attacking)
	if not attacking:
		velocity = wander.direction * 50
	else:
		velocity = (target.position - position).normalized() * 50
	animated_sprite_2d.scale.x = velocity.x / abs(velocity.x)
	move_and_slide()


func _on_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		attacking = true
		target = body


func _on_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		attacking = false


func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		body.next_damage = damage
		body.damage_cooldown.start()


func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		body.damage_cooldown.stop()
		if body.next_damage == damage:
			body.next_damage = 0
