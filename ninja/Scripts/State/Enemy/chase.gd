extends State

var player: CharacterBody2D

func enter():
	print("ENEMY Chase state")
	player = enemy.player_reference

func exit():
	pass

func physics_update(delta: float):
	if not enemy.is_active:
		return
	
	if not enemy.player_in_detectBox:
		enemy.state_machine.change_state_by_name("patrol")
		return
	
	if player.global_position.x > enemy.global_position.x:
		enemy.direction = 1
		enemy.animated_sprite_2d.flip_h = false
	else:
		enemy.direction = -1
		enemy.animated_sprite_2d.flip_h = true

	enemy.global_position.x += enemy.direction * enemy.chase_speed * delta

		
