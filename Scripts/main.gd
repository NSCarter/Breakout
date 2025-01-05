extends Node2D


var block_scene = preload("res://Scenes/Block.tscn")


func _ready() -> void:
	for i in range(1, 17):
		for j in range(1, 9):
			var block = block_scene.instantiate() as StaticBody2D
			block.name = "Block " + str(i) + str(j)
			var x = 15 + 4.8 * i + (65 * (i - 1))
			var y = 90 + 4.8 * j + (20 * (j - 1))
			block.position = Vector2(x, y)
			add_child(block)
