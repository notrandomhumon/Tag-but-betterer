extends Area2D

@onready var red_character: CharacterBody2D = %"red_character"

func _on_body_entered(body: Node2D) -> void: 
	if body.name == "red_character":
		print("amongus")
