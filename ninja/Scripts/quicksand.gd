extends Area2D

@export var teleport_delay = 3.0

var player = null
@onready var timer: Timer = $Timer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	timer.wait_time = teleport_delay
	animated_sprite.play("idle")

func _on_body_entered(body: Node2D):
	player = body
	timer.start()
	animated_sprite.play("idle")

func _on_body_exited(body: Node2D):
	player = null
	timer.stop()
	animated_sprite.play("idle")

func _on_timer_timeout():
	if player:
		animated_sprite.play("drown")
		player.current_health = 0
		player.health_changed.emit(0, player.MAX_HEALTH)
		player.reset_position()
