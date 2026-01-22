extends State

func enter():
	print("ENEMY Death state")
	enemy.is_active = false
	enemy.queue_free()
