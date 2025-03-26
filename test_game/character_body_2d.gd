extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -200
const CLIMB_VELOCITY = -100


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if velocity != Vector2(0, 0):
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var tile_map_layer = get_node("../front_layer")
	var tile_atlas_pos = tile_map_layer.get_cell_atlas_coords(tile_map_layer.local_to_map(position))
	if Input.is_action_pressed("ui_accept") and (tile_atlas_pos == Vector2i(0, 7) or tile_atlas_pos == Vector2i(0, 8)):
		velocity.y = CLIMB_VELOCITY
	move_and_slide()
