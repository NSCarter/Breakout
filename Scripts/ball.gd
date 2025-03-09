extends CharacterBody2D


var _stored_velocity: Vector2


func _ready():
	velocity = Vector2(0, -350)
	get_parent().resumed.connect(_on_resume)


func _process(_delta):
	var ball_pos = position.y
	
	if ball_pos > 648:
		Stats.update_lives()
		_stored_velocity = velocity
		velocity = Vector2(0, 0)


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if velocity.x > 0:
			velocity.x += 10
		else:
			velocity.x -= 10
		
		var collider = collision.get_collider()
		
		if collider.name == "Paddle":
			var paddle = collider as StaticBody2D
			var paddle_pos = paddle.position
			var collision_pos = collision.get_position()
			var pos_on_paddle = collision_pos.x - paddle_pos.x
			
			if (pos_on_paddle < 47.5):
				velocity = Vector2((47.5 - pos_on_paddle) * -4, velocity.y * -1)
			else:
				velocity = Vector2((pos_on_paddle - 47.5) * 4, velocity.y * -1)
		elif "Block" in collider.name:
			velocity = Vector2(velocity.x, (velocity.y * -1) + 2.5)
			get_parent().remove_child(collider)
			Stats.update_score()
		else:
			velocity = velocity.bounce(collision.get_normal())


func _on_resume():
	velocity = _stored_velocity
