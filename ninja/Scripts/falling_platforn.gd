extends StaticBody2D

@export var delay := 0.5
@export var fall_speed := 600

var falling := false

@onready var timer: Timer = $Timer

func _ready():
	timer.wait_time = delay

func _physics_process(delta):
	if falling:
		position.y += fall_speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.current_health)
	if not falling:
		timer.start()

func _on_timer_timeout() -> void:
	falling = true
 # Replace with function body.
# cant do one way collision idk why
