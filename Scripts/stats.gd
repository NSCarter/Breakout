extends Node

signal score_changed(score)
signal life_lost(lifes)

var _score = 0
var _lives = 3


func update_score():
	_score += 1
	score_changed.emit(_score)


func update_lives():
	_lives -= 1
	life_lost.emit(_lives)


func set_score(score):
	_score = 0

	
func set_lives(lives):
	_lives = 3
