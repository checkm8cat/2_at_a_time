extends CharacterBody2D
## add a way to commiunicate to circut
const SPEED = 850.0
const JUMP_VELOCITY = -2000.0
var slot1 = 0
var slot2 = 0
var dash_cooldown = 0
var c_velocityx = 0
var c_velocityy = 0




func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		$Timer.stop()
		dash_cooldown = 0
	if not is_on_floor():
		velocity += 2 * get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor() and(slot1 == 2 or slot2 == 2):

		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")

	if velocity.y >= 2000:
		velocity.y = 2000




	if Input.is_action_just_pressed("Dash") and(slot1 == 1 or slot2 == 1) and dash_cooldown == 0:
		$Timer.start()
		c_velocityx = velocity.x
		c_velocityy = velocity.y
		velocity.y = 0
		velocity.x = direction * SPEED * 10
		dash_cooldown = 1
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
	
	


func _on_timer_timeout() -> void:
	velocity.y = c_velocityy
	c_velocityx = 0
	c_velocityy = 0
	pass # Replace with function body.
