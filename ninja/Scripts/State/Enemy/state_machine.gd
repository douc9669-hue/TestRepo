extends Node

@export var initial_state : State
var current_state: State
var states: Dictionary = {}

@onready var enemy = get_parent()

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.enemy = enemy
	
	if initial_state:
		change_state_by_name(initial_state.name)

func _process(delta):
	if current_state:
		current_state.update(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)

func change_state(new_state: State):
	if current_state:
		current_state.exit()
	
	current_state = new_state
	
	if current_state:
		current_state.enter()

func change_state_by_name(state_name: String):
	var new_state = states.get(state_name.to_lower())
	if new_state != null:
		change_state(new_state)
	
