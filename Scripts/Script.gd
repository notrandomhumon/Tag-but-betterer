extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const COYOTE_TIME := 0.1
const JUMP_BUFFER_TIME := 0.1
var double_jump_collected := false
var can_double_jump := false
var coyote_timer := 0.0
var jump_buffer_timer := 0.0
var double_jump_time_remaining := 10.0
@onready var animated_sprite = $AnimatedSprite2D
func jump():
	velocity.y = JUMP_VELOCITY
	
func _physics_process(delta: float) -> void:
	if double_jump_collected:
		if double_jump_time_remaining > 0:
			double_jump_time_remaining -= delta
		else:
			double_jump_collected = false

	
		
		
	var direction := Input.get_axis("a", "d")
	
		
		
	if direction != 0:
		animated_sprite.flip_h = direction < 0
	if Input.is_action_just_pressed("w") and can_double_jump:
		jump()
		can_double_jump = false
	if not is_on_floor():
		velocity += get_gravity() * delta
		coyote_timer -= delta
		 
	else:
		coyote_timer = COYOTE_TIME
		if double_jump_collected:
			can_double_jump = true
	if Input.is_action_just_pressed("w"):
		if not is_on_floor and can_double_jump:
			jump()
			print("double jumped")
			can_double_jump = false
		else:
			jump_buffer_timer = JUMP_BUFFER_TIME
			
			
			
	else:
		jump_buffer_timer -= delta
	
	if jump_buffer_timer > 0.0 and coyote_timer > 0.0:
		jump()
		coyote_timer = 0.0 
		jump_buffer_timer = 0.0

	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()

	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
	else:
		if direction != 0:
			animated_sprite.play("Run")
		else:
			animated_sprite.play("Idle")
