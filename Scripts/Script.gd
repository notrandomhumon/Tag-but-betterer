extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const COYOTE_TIME := 0.15
const JUMP_BUFFER_TIME := 0.15

var coyote_timer := 0.0
var jump_buffer_timer := 0.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("a", "d")
	
	if direction != 0:
		animated_sprite.flip_h = direction < 0
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		coyote_timer -= delta
	else:
		coyote_timer = COYOTE_TIME

	if Input.is_action_just_pressed("w"):
		jump_buffer_timer = JUMP_BUFFER_TIME
	else:
		jump_buffer_timer -= delta
	
	if jump_buffer_timer > 0.0 and coyote_timer > 0.0:
		velocity.y = JUMP_VELOCITY		
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
