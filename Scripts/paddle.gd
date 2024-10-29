extends StaticBody2D


func _process(_delta):
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
