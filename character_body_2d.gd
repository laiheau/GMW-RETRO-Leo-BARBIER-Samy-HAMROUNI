extends CharacterBody2D
@onready var anim: AnimatedSprite2D = $anim
@onready var health_bar = $healthBar
@onready var damage_cooldown: Timer = $damage_cooldown
@onready var tile_map_layer = get_node("../front_layer")



const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const CLIMB_VELOCITY = -200.0
const GRAVITY = Vector2(1300, 1300)
var isAttacking = false
enum DIMS {DAY, NIGHT}
var currentDim = DIMS.DAY
var health = 100
var next_damage = 0

func _ready() -> void:
	add_to_group("Player")

func player():
	pass

func getDIm():
	return currentDim

func _physics_process(delta: float) -> void:
	health_bar.value = health
	if isAttacking and not anim.is_playing():
		isAttacking = false
	if not is_on_floor():
		if isAttacking:
			anim.play("Attack2")
		velocity += GRAVITY * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("switchDimension"):
		currentDim = (currentDim + 1) % DIMS.size()
	
	var direction := Input.get_axis("left", "right")
	if Input.is_action_just_pressed("attack"):
		anim.play("Attack")
		isAttacking = true
	if direction :
		if not isAttacking:
			anim.play("Run")
		anim.scale.x = direction
		velocity.x = direction * SPEED
	else:
		if not isAttacking:
			anim.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var tile_atlas_pos = tile_map_layer.get_cell_atlas_coords(tile_map_layer.local_to_map(position))
	if Input.is_action_pressed("jump") and (tile_atlas_pos == Vector2i(0, 7) or tile_atlas_pos == Vector2i(0, 8)):
		velocity.y = CLIMB_VELOCITY
	move_and_slide()
