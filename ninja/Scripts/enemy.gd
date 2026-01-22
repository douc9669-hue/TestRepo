extends CharacterBody2D

@export var patrol_speed = 100.0
@export var patrol_distance = 300.0
@export var chase_speed = 200.0
@export var attack_damage = 25
@export var attack_cooldown = 1.0 
@export var max_health = 3

var current_health = max_health

var direction = 1 
var is_active = true
var player_in_detectBox = false
var player_in_attackBox = false
var player_reference: CharacterBody2D

@onready var right_edge_ray: RayCast2D = $Rays/RightEdgeRay
@onready var left_edge_ray: RayCast2D = $Rays/LeftEdgeRay
@onready var right_wall_ray: RayCast2D = $Rays/RightWallRay
@onready var left_wall_ray: RayCast2D = $Rays/LeftWallRay
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine = $StateMachine

func _on_detection_body_entered(body: CharacterBody2D) -> void:
	player_reference = body
	player_in_detectBox = true
	state_machine.change_state_by_name("chase")

func _on_detection_body_exited(body: CharacterBody2D) -> void:
	player_in_detectBox = false
	player_reference = null 

func _on_attack_body_entered(body: CharacterBody2D) -> void:
		player_in_attackBox = true
		state_machine.change_state_by_name("attack")

func _on_attack_body_exited(body: CharacterBody2D) -> void:
	player_in_attackBox = false

func take_damage(damage: int) -> void:
	current_health -= damage
	if current_health <= 0:
		die()

func die() -> void:
	print("Enemy died!")
	state_machine.change_state_by_name("death")
