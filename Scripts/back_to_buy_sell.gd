extends Button

@export var map_screen:Node2D

func _pressed() -> void:
	var root = get_tree().root
	SceneManagement.map_screen = map_screen
	#SceneManagement.setup_core_scenes()
	root.add_child(SceneManagement.buy_sell)
	root.remove_child(SceneManagement.map_screen)
