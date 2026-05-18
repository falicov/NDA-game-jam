extends Control

func _on_start_pressed() -> void:
	print("Hello")
	get_tree().change_scene_to_file("res://dialogic.tscn")
