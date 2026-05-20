extends Button

#var node_a = get_parent().get_node("root_scene")
var threshold = 50000
var money_temp = 50000

func _on_pressed() -> void:
	#SceneManagement.setup_core_scenes()
	#root.add_child(SceneManagement.dialogic)
	#root.remove_child(SceneManagement.title_screen)
	get_tree().change_scene_to_file("res://screens/dialogic.tscn")
	Dialogic.start("Introduction")
	Dialogic.signal_event.connect(_on_signal)

func _on_signal(signal_passed_in):
	match signal_passed_in:
		"Tutorial":
			get_tree().change_scene_to_file("res://screens/map_screen.tscn")
			Dialogic.start("Tutorial")
		"End":
			get_tree().change_scene_to_file("res://screens/map_screen.tscn")
		"Start":
			get_tree().change_scene_to_file("res://screens/dialogic.tscn")
			Dialogic.start("Day")
		"Final":
			#var node_a = get_parent().get_node("root_scene")
			if (money_temp >= threshold):
				if (money_temp > threshold * 2):
					Dialogic.VAR.ending = 4
				else:
					var ending_dict = {
						"Narcisa" : Dialogic.VAR.narcisa_s,
						"Rico" : Dialogic.VAR.rico_s,
						"Vera" : Dialogic.VAR.vera_s
					}
					var highest_points = ending_dict.values().max()
					var which_ending = ending_dict.find_key(highest_points)
					match which_ending: 
						"Narcisa":
							Dialogic.VAR.ending = 1
						"Rico":
							Dialogic.VAR.ending = 2
						"Vera":
							Dialogic.VAR.ending = 3
			else:
				Dialogic.VAR.ending = 0
			get_tree().change_scene_to_file("res://screens/dialogic.tscn")
			Dialogic.start("Endings")
