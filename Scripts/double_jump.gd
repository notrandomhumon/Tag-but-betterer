extends Area2D

@onready var red_character: CharacterBody2D = %"red character"
@onready var blue_character: CharacterBody2D = %"blue character"

func _on_body_entered(body) -> void:
	if body.name == red_character:
		queue_free()
	

	
	
	
