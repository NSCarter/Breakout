extends Node2D


signal resumed

var _block_scene = preload("res://Scenes/Block.tscn")


func _ready() -> void:
	var row_colours= [
		"df293d", 
		"df293d", 
		"f9ae05", 
		"f9ae05", 
		"3eea52", 
		"3eea52", 
		"ebe83d", 
		"ebe83d",
	]
	
	for i in range(1, 17):
		for j in range(1, 9):
			var block = _block_scene.instantiate() as StaticBody2D
			block.name = "Block " + str(i) + str(j)
			block.get_node("ColorRect").color = row_colours[j - 1]
			var x = 15 + 4.8 * i + (65 * (i - 1))
			var y = 90 + 4.8 * j + (20 * (j - 1))
			block.position = Vector2(x, y)
			add_child(block)
			
	$Lives.reset.connect(_reset)
	$Ball.ceiling_hit.connect(_shorten_paddle)


func _reset():
	$Paddle.paused = true
	if $Ball.hit_ceiling:
		$Paddle.position = Vector2(540.375, 628)
	else:
		$Paddle.position = Vector2(528.5, 628)
		
	$Ball.position = Vector2(568.5, 613)
	$StartTimer.start()
	await $StartTimer.timeout
	resumed.emit()
	$Paddle.paused = false


func _shorten_paddle():
	$Paddle.scale = Vector2(0.75, 1)
