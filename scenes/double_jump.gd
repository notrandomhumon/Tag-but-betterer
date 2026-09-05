extends Area2D
@onready var character_body_2d: CharacterBody2D = %CharacterBody2D

func _ready():
	print("geometry game")
	


func _on_body_entered(_body) -> void:
	queue_free()
	character_body_2d.can_double_jump = true
	
