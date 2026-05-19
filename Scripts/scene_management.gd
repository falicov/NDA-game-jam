extends Node

#core gameplay screens. need a constant reference to both, even when not in scene tree
var buy_sell
var map_screen

#this must always be run before navigating to one of these scenes
func setup_core_scenes() -> void:
	#core gameplay screens. need a constant reference to both, even when not in scene tree
	if(buy_sell == null):
		buy_sell = load("res://screens/buy_sell_screen.tscn").instantiate()
	if(map_screen == null): 
		map_screen = load("res://screens/map_screen.tscn").instantiate()
