extends StaticBody2D

var is_game_over = false


func _ready():
	get_parent().get_node("Lives").game_over_signal.connect(_game_over)


func _process(_delta):
	if not is_game_over:
		if Input.is_action_pressed("Left"):
			_move_left()
		if Input.is_action_pressed("Right"):
			_move_right()


func _move_left():
	position.x -= 5
	
	if position.x < 15:
		position.x = 15


func _move_right():
	position.x += 5
	
	if position.x > 1042:
		position.x = 1042


func _game_over():
	is_game_over = true
