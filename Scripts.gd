extends CharacterBody2D
## add a way to commiunicate to circut
const SPEED = 850.0
const JUMP_VELOCITY = -1750.0
var slot1 = 0
var slot2 = 0




func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += 2 * get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor() and(slot1 == 2 or slot2 == 2):
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")

	if Input.is_action_just_pressed("Dash") and(slot1 == 1 or slot2 == 1):
		velocity.x = direction * SPEED * 10
		pass


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction and abs(velocity.x) <= SPEED:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_circut_grabbed(variant) -> void:
	if(slot1 == 0):
		slot1 = variant
	else: if(slot2 == 0):
		slot2 = variant
	
	pass # Replace with function body.
