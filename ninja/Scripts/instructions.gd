extends CanvasLayer

@onready var instructions: CanvasLayer = $"."

func _ready():
	instructions.visible = false

func show_instructions():
	instructions.visible = true

func _on_back_button_pressed():
	instructions.visible = false
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
