extends Area2D

@export var speed = 500.0
@export var damage = 1

var direction = Vector2(1, 0)

func _physics_process(delta):
	global_position += direction * speed * delta

func _on_body_entered(body: Node2D):
	if body is CharacterBody2D:
		body.take_damage(damage)
		queue_free()
	elif body is TileMapLayer:
		queue_free()
