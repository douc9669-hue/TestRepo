extends State

var player: CharacterBody2D

@onready var attack_timer: Timer = $Timer

func enter():
	print("ENEMY Attack state")
	player = enemy.player_reference
	attack_timer.wait_time = enemy.attack_cooldown
	attack_timer.start()

func exit():
	attack_timer.stop()

func physics_update(delta: float):
	if not enemy.is_active:
		return
	
	if not enemy.player_in_attackBox:
		enemy.state_machine.change_state_by_name("chase")
		return
	
	if player.global_position.x > enemy.global_position.x:
		enemy.direction = 1
		enemy.animated_sprite_2d.flip_h = false
	else:
		enemy.direction = -1
		enemy.animated_sprite_2d.flip_h = true

func _on_timer_timeout() -> void:
		player.take_damage(enemy.attack_damage)
		attack_timer.start()
		
