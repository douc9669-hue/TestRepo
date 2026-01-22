extends Control

@export_file var game_scene_path = "res://Scene/world.tscn"
var game_scene

func _ready():
	game_scene = load(game_scene_path)

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(game_scene)


func _on_quit_button_pressed():
	get_tree().quit()
