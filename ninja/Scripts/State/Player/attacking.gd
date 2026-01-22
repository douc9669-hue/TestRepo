extends State

var player: CharacterBody2D

func enter():
	player.is_attacking = true
	player.animated_sprite_2d.play("attack")
	
	for enemy in player.enemies_in_range:
			enemy.take_damage(10)

func exit():
	player.is_attacking = false

func update(delta: float):
	var sprite_frames = player.animated_sprite_2d.sprite_frames
	var frame_count = sprite_frames.get_frame_count("attack")
	if player.animated_sprite_2d.frame >= frame_count - 1:
			if !player.is_on_floor():
				player.state_machine.change_state_by_name("jumping")
			else:
				var move_dir = Input.get_axis("move_left", "move_right")
				if move_dir != 0:
					player.state_machine.change_state_by_name("walking")
				else:
					player.state_machine.change_state_by_name("idle")

func physics_update(delta: float):
	if not player.active:
		return
	
	if !player.is_on_floor():
		player.velocity.y += player.gravity * delta
		if player.velocity.y > player.max_fall_speed:
			player.velocity.y = player.max_fall_speed
	else:
		player.velocity.x = 0
	
	player.move_and_slide()
