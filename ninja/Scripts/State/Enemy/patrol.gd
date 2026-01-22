extends State

var start_position = Vector2.ZERO

func enter():
	start_position = enemy.global_position
	print("ENEMY Patrol state")

func physics_update(delta: float):
	if not enemy.is_active:
		return
	
	var should_turn = false
	
	if enemy.direction > 0:
		if not enemy.right_edge_ray.is_colliding() or enemy.right_wall_ray.is_colliding():
			should_turn = true
			enemy.animated_sprite_2d.flip_h = false
	else:
		if not enemy.left_edge_ray.is_colliding() or enemy.left_wall_ray.is_colliding():
			should_turn = true
			enemy.animated_sprite_2d.flip_h = true
	
	var distance_from_start = abs(enemy.global_position.x - start_position.x)
	
	if distance_from_start >= enemy.patrol_distance:
		should_turn = true
	
	if should_turn:
		enemy.direction *= -1
	
	enemy.global_position.x += enemy.direction * enemy.patrol_speed * delta
	
