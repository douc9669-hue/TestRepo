extends CanvasLayer

@onready var win: CanvasLayer = $".
@onready var score_label: Label = $VBoxContainer/ScoreLabel
@onready var coin_label: Label = $VBoxContainer/CoinLabel

func _ready():
	win.visible = false

func show_victory(score, coins):
	score_label.text = "Score: " + str(score)
	coin_label.text = "Coins Collected: " + str(coins)
	get_tree().paused = true
	win.visible = true

func _on_next_level_button_pressed() -> void:
	get_tree().paused = false
	win.visible = false
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn") 

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	win.visible = false
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
