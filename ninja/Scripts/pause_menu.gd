extends CanvasLayer

@onready var pause_menu: CanvasLayer = $"."

func _ready():
	pause_menu.visible = false
	get_tree().paused = false

func _process(delta : float) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle_pause()

func toggle_pause():
	if get_tree().paused:
		pause_menu.visible = false
		get_tree().paused = false
	else:
		pause_menu.visible = true
		get_tree().paused = true

func _on_resume_button_pressed():
	toggle_pause()

func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
