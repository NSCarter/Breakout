extends Node2D


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
	Stats.set_lives(3)
	Stats.set_score(0)
	queue_free()
