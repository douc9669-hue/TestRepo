extends Area2D

@export var fire_rate = 2.0
@export var max_health = 3

var health = 3
var player: CharacterBody2D = null

@onready var timer: Timer = $Timer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	health = max_health
	timer.wait_time = fire_rate

func _on_body_entered(body: Node2D):
	if body is CharacterBody2D:
		player = body
		timer.start()
		animated_sprite.play("attack")
		update_facing()

func _on_body_exited(body: Node2D):
	if body == player:
		player = null
		timer.stop()
		animated_sprite.play("idle")

func _on_timer_timeout():
	if player:
		shoot_fire()

func shoot_fire():
	var fire_scene = load("res://Scene/fire_projectile.tscn")
	var fire = fire_scene.instantiate()
	get_tree().current_scene.add_child(fire)
	
	fire.global_position = global_position + Vector2(0,-50)

	fire.direction = (player.global_position - fire.global_position).normalized()

	#move it a little way in the direction it's going to move
	fire.global_position = fire.global_position + fire.direction * 40
	
	update_facing()

func update_facing():
	if player:
		if player.global_position.x < global_position.x:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false

func take_damage(amount: int):
	health -= amount
	if health <= 0:
		die()

func die():
	await get_tree().create_timer(0.8).timeout
	queue_free()

func _on_hitbox_area_entered(area: Area2D):
	if area.collision_layer == 8 and area.name == "Weapon":
		take_damage(1)
