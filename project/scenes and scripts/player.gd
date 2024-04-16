extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -800.0
const acceleration = 4000.0


# Get the gravity from the project settings to be 
var og_gravity = Vector2(0,900)
@export var gravity = og_gravity
@export var inspace = false
var sprite 
var right = true

func _ready():
	sprite = $AnimatedSprite2D
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity.y * delta
	
	if inspace:
		velocity.x += gravity.x * delta
		velocity.y = lerp(velocity.y,0.0,2.0*delta)

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor() and not inspace:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#if InputEventAction("")
	
		
	var direction = Input.get_axis("left", "right")
	if direction:
		if inspace == false:
			velocity.x += direction * acceleration * delta
			velocity.x = clamp(velocity.x, -SPEED, SPEED)
	else: if inspace == false:
		
		velocity.x = move_toward(velocity.x, 0, acceleration*delta)

	move_and_slide()
	if position.x > 1995:
		glob.emit_signal("toRight")
	else: if position.x < -75:
		glob.emit_signal("toLeft")
	
	if is_on_floor():
		if velocity.x !=0:
			sprite.play("walkright")
		else:
			sprite.play("idleright")
	else:
		sprite.play("walkright")
		sprite.stop()
		
	if velocity.x > 0:
		right = true
	else: if velocity.x < 0:
		right = false
		
		
	if right:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
		
	
		
