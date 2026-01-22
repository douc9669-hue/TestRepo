extends CharacterBody2D

@export var gravity = 700
@export var jump_force = 600
@export var speed = 500
@export var max_fall_speed = 500
@export var MAX_HEALTH= 100
var current_health

var move_dir := 0      
var active = true
var is_attacking = false
var spawn_position: Vector2
var enemies_in_range = [] 

@onready var animated_sprite_2d: AnimatedSprite2D = $animated_sprite_2d
@onready var state_machine = $StateMachine

signal health_changed(current, max_health)

func _ready():
	current_health = MAX_HEALTH
	spawn_position = global_position
	health_changed.emit(current_health, MAX_HEALTH)


func take_damage(amount):
	current_health -= amount
	print("Health: ", current_health)
	health_changed.emit(current_health, MAX_HEALTH)
	
	if current_health <= 0:
		die()

func die():
	active = false

func reset_position():
	global_position = spawn_position
	velocity = Vector2.ZERO
	
	current_health = MAX_HEALTH
	health_changed.emit(current_health, MAX_HEALTH)

func shoot_weapon():
	var weapon_scene = load("res://Scene/weapon.tscn")
	var weapon = weapon_scene.instantiate()
	get_tree().current_scene.add_child(weapon)
	weapon.global_position = global_position
	
	if animated_sprite_2d.flip_h:
		weapon.direction = -1
	else:
		weapon.direction = 1

func _on_attack_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy") and body not in enemies_in_range:
		enemies_in_range.append(body)	

func _on_attack_body_exited(body: Node2D) -> void:
	if body in enemies_in_range:
		enemies_in_range.erase(body)
		
