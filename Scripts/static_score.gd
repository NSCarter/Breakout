extends Node2D


func _ready() -> void:
	var score_type = get_meta("score_type")
	var score = 0
	
	if score_type == "score":
		score = Stats._score
	else:
		score = Stats.high_score
	
	if score >= 100:
		var hundreds = floor(score / 100)
		score = int(score) % 100
		
		var hundreds_node = get_node("Hundreds") as TextureRect
		hundreds_node.texture = load("res://Assets/Images/" + str(hundreds) + ".png")
		
		if score == 0:
			var tens_node = get_node("Tens") as TextureRect
			tens_node.texture = load("res://Assets/Images/0.png")
	
	if score >= 10:
		var tens = floor(score / 10)
		score = int(score) % 10
		
		var tens_node = get_node("Tens") as TextureRect
		tens_node.texture = load("res://Assets/Images/" + str(tens) + ".png")
	
	var ones_node = get_node("Ones") as TextureRect
	ones_node.texture = load("res://Assets/Images/" + str(score) + ".png")
