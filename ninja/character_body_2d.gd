extends CharacterBody2D


func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("move_left","move_right","jump","ui_down") * 150
	move_and_slide()
