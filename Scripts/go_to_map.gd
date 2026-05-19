extends Button
@export var buy_sell:Control

func _pressed() -> void:
	var root = get_tree().root
	SceneManagement.buy_sell = buy_sell
	SceneManagement.setup_core_scenes()
	root.add_child(SceneManagement.map_screen)
	root.remove_child(SceneManagement.buy_sell)
