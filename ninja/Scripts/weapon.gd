extends Area2D

@export var fire_speed = 1000
var direction := 1

func _physics_process(delta: float) -> void:
	global_position.x += fire_speed * direction * delta
	

func _on_area_entered(area: Area2D) -> void:
	if area.collision_layer == 16:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		queue_free()
