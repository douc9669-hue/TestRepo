extends CanvasLayer

@onready var coin_label: Label = $HBoxContainer/Coin/CoinLabel
@onready var health_bar: ProgressBar = $HBoxContainer/Heart/HealthBar
@onready var health_label: Label = $HBoxContainer/Heart/HealthLabel
@onready var timer_label: Label = $HBoxContainer/TimerLabel

var game_time = 0.0

func _ready():
	var red_style = StyleBoxFlat.new()
	red_style.bg_color = Color(1, 0, 0, 1)
	health_bar.add_theme_stylebox_override("fill", red_style)
	timer_label.text = "Time: 0:00"

func _process(delta):
	game_time += delta
	var minutes = int(game_time / 60)
	var seconds = int(game_time) % 60
	var seconds_str = str(seconds)
	if seconds < 10:
		seconds_str = "0" + seconds_str
	timer_label.text = "Time: " + str(minutes) + ":" + seconds_str

func update_coins(value):
	coin_label.text = str(value)
	
func update_health(current, max_health):
	health_bar.max_value = max_health
	health_bar.value = current
	health_label.text = str(current) + "/" + str(max_health)
	
