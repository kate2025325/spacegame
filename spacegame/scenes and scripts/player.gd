extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -800.0
const acceleration = 2000.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#if InputEventAction("")
	
		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x += direction * acceleration * delta
		velocity.x = clamp(velocity.x, -SPEED, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration*delta)

	move_and_slide()
	if position.x > 1995:
		glob.emit_signal("toRight")
	else: if position.x < -75:
		glob.emit_signal("toLeft")
		
