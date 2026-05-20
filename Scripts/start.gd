extends Button

var root
@export var title_screen:Control

func _ready() -> void:
	root = get_tree().root
	#SceneManagement.title_screen = title_screen

func _on_pressed() -> void:
	SceneManagement.setup_core_scenes()
	root.add_child(SceneManagement.dialogic)
	Dialogic.start("Introduction")
	title_screen.free()
	#get_tree().change_scene_to_file("res://screens/dialogic.tscn")
