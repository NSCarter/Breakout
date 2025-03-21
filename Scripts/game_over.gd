extends Node2D


func _ready() -> void:
	if Stats.save_high_score:
		_save()


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
	Stats.reset_lives()
	Stats.reset_score()
	queue_free()


func _save():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	save_file.store_string(str(Stats.high_score))
	Stats.save_high_score = false
