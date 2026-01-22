extends CanvasLayer

@onready var game_over: CanvasLayer = $"."
@onready var score_label: Label = $VBoxContainer/ScoreLabel
@onready var coin_label: Label = $VBoxContainer/CoinLabel

func _ready():
	#game_over.visible = false
	pass

func show_game_over(score, coins):
	score_label.text = "Score: " + str(score)
	coin_label.text = "Coins Collected: " + str(coins)
	get_tree().paused = true
	game_over.visible = true


func _on_retry_button_pressed()-> void:
	get_tree().paused = false
	game_over.visible = false
	get_tree().reload_current_scene()


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	game_over.visible = false
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
