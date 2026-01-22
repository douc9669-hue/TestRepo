extends Area2D



func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		#var world = get_tree().current_scene
		#world.add_coin(1)
		queue_free()
