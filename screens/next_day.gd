extends Button

@export var buy_sell:Control


# Called when the node enters the scene tree for the first time.
func _pressed() -> void:
	var root = get_tree().root
	SceneManagement.buy_sell = buy_sell
	SceneManagement.setup_core_scenes()
	GameManager.current_day += 1
	root.add_child(SceneManagement.map_screen)
	SceneManagement.map_screen.start_playing()
	get_parent().hide()
	root.remove_child(SceneManagement.buy_sell)
