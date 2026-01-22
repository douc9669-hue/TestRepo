extends Node2D

@export var damage := 1

func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage)	
	print("body.current_health")


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	
	print("body.current_health") # Replace with function body.
