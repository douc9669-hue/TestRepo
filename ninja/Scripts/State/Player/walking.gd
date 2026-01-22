extends State

var player: CharacterBody2D

func enter():
	player.animated_sprite_2d.play("walking")

func exit():
	pass

func physics_update(delta: float):
	if not player.active:
		return
	
	if !player.is_on_floor():
		player.velocity.y += player.gravity * delta
		if player.velocity.y > player.max_fall_speed:
			player.velocity.y = player.max_fall_speed
		player.state_machine.change_state_by_name("jumping")
		return
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = -player.jump_force
		player.state_machine.change_state_by_name("jumping")
		return
	
	if Input.is_action_just_pressed("shoot"):
		player.state_machine.change_state_by_name("attacking")
		return
	
	var move_dir = Input.get_axis("move_left", "move_right")
	
	if move_dir == 0:
		player.state_machine.change_state_by_name("idle")
		return
	
	player.animated_sprite_2d.flip_h = move_dir < 0
	
	player.velocity.x = move_dir * player.speed
	player.move_and_slide()
