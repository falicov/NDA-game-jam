extends Node2D
class_name MapScreenManager

var map_playing:bool
@export var time_left_text:Label
@export var playing_gui:HBoxContainer
@export var viewing_gui:HBoxContainer 

@export var map:Map
var miner = preload("res://miner.tscn")

var start_time:float
var time_in_day:float = 50000 #in milliseconds (subtract 3 0s to get sec)



var time_left:
	get: return time_in_day - (Time.get_ticks_msec() - start_time)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#uncomment to test miners in scene! + other scene specific mechanics
	start_playing()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(map_playing):
		
		time_left_text.text = str(snapped(time_left/1000, 0.01))
		
		if(time_left <= 0):
			map_playing = false
			viewing_gui.show()
			playing_gui.hide()
			#transition away from map here
	



func start_playing() ->void:
	for miner in GameManager.miners:
		map.add_child(miner)
		miner.map = map
		miner.map_screen_manager = self
		miner.position = map.map_to_local(map.mine_base)
	
	start_time = Time.get_ticks_msec()
	
	playing_gui.show()
	viewing_gui.hide()
	
	map_playing = true




#func check_miner_stop_time() -> bool:
#	if(Time.get_ticks_msec() - start_time >= start_time - time_miners_stop):
#		return true
#	else:
#		return false
