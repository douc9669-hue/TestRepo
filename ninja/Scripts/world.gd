extends Node

@onready var player: CharacterBody2D = $Player
@onready var game_ui: CanvasLayer = $GameUI

var key = 0
var coins = 0

func _ready():
	# Initialize UI
	game_ui.update_coins(coins)
	# Use MAX_HEALTH so the bar is full even if current_health is not set yet
	game_ui.update_health(player.MAX_HEALTH, player.MAX_HEALTH)
	
	# Connect player health signal
	player.health_changed.connect(_on_player_health_changed)

func add_coin(amount = 1):
	coins += amount
	game_ui.update_coins(coins)

func _on_player_health_changed(current, max_health):
	game_ui.update_health(current, max_health)
