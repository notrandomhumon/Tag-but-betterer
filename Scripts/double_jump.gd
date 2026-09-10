extends Area2D

@onready var red_character: CharacterBody2D = %"red_character"
@onready var blue_character: CharacterBody2D = %"blue_character"

func _on_body_entered(body) -> void:
	if (body.name == 'blue_character'):
		queue_free()
		blue_character.double_jump_collected = true
	elif (body.name == 'red_character'):
		queue_free()
		red_character.double_jump_collected = true
