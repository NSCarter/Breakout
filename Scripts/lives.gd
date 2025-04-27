extends Control


var _game_over_scene = preload("res://Scenes/GameOver.tscn")
signal reset
signal game_over_signal


func _ready():
	Stats.life_lost.connect(_on_life_lost)


func _on_life_lost(lifes):
	if lifes == 2:
		$"Life 1".visible = false
		reset.emit()
	elif lifes == 1:
		$"Life 2".visible = false
		reset.emit()
	else:
		$"Life 3".visible = false
		_show_game_over()


func _show_game_over():
	var game_over = _game_over_scene.instantiate() as Node2D
	get_parent().add_child(game_over)
	game_over_signal.emit()
