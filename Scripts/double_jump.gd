extends Area2D

@onready var character_body_2d: CharacterBody2D = %CharacterBody2D
@onready var timer: Timer = $Timer


func _on_body_entered(_body) -> void:
	queue_free()
	character_body_2d.double_jump_collected = true
	
	
