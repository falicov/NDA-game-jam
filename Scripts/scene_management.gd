extends Node

#core gameplay screens. need a constant reference to both, even when not in scene tree
var buy_sell
var map_screen:MapScreenManager
var title_screen
var dialogic

func _ready() -> void:
	setup_core_scenes()

#this must always be run before navigating to one of these scenes
func setup_core_scenes() -> void:
	#core gameplay screens. need a constant reference to both, even when not in scene tree
	if(buy_sell == null):
		buy_sell = load("res://screens/buy_sell_screen.tscn").instantiate()
	if(map_screen == null): 
		map_screen = load("res://screens/map_screen.tscn").instantiate()
	if(title_screen == null):
		title_screen = load("res://screens/title_screen.tscn").instantiate()
	if(dialogic == null):
		dialogic = load("res://screens/dialogic.tscn").instantiate()
