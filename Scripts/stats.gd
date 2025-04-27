extends Node

signal score_changed(score)
signal life_lost(lifes)


var high_score = 0
var save_high_score = false
var _score = 0
var _lives = 3


func _ready():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	if save_file != null:
		high_score = int(save_file.get_as_text())


func update_score():
	_score += 1
	score_changed.emit(_score)
	
	if _score > high_score:
		high_score = _score
		save_high_score = true


func update_lives():
	_lives -= 1
	life_lost.emit(_lives)


func reset_score():
	_score = 0


func reset_lives():
	_lives = 3
