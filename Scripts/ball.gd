extends CharacterBody2D


var _stored_velocity: Vector2


func _ready():
	velocity = Vector2(0, -350)


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
			velocity = velocity.bounce(collision.get_normal())
			get_parent().remove_child(collider)
		else:
			velocity = velocity.bounce(collision.get_normal())
