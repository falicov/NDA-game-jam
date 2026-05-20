extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().root.min_size = Vector2i(1920, 1080)
	get_tree().root.content_scale_size = Vector2i(1920, 1080)
	pass # Replace with function body.
