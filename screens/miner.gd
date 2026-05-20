extends AnimatedSprite2D

@export var map:Map
@export var map_screen_manager:MapScreenManager

var _current_tile:Vector2i
var _mining_tile:Vector2i

var speed = 500 #per second

func _ready() -> void:
	GameManager.miners.append(self)

func _process(delta: float) -> void:
	#check if we aren't supposed to be doing anything
	if(map_screen_manager == null || !map_screen_manager.map_playing 
	|| map == null):
		get_parent().remove_child(self)
		return
	
	
	#note that this section also depends on scene architecture!
	#figure out where to move
	if(check_time_home()):
		_current_tile = map.mine_base
	elif(_current_tile != _mining_tile || _current_tile == Vector2i(0,0)):
		if(_mining_tile != Vector2i(0,0)):
			# go to the tile I was mining
			_current_tile = _mining_tile
		else:
			if(_current_tile != Vector2i(0,0) && map.tile_is_mineable(_current_tile)):
				#set to mining tile!
				_mining_tile = _current_tile
			elif(_current_tile == Vector2i(0,0) || _current_tile== map.local_to_map(position)):
				print("searching for tiles")
				#look around me for mineable tiles
				_current_tile = next_tile()
	
	#mine a tile
	if(map.local_to_map(position) == _mining_tile):
		print("I'm mining!")
	
	#or move
	else:
		var dist_to_tile = map.map_to_local(_current_tile) - position
		position += delta * speed * dist_to_tile/dist_to_tile.length()


func next_tile() -> Vector2i:
	if _current_tile == Vector2i(0,0):
		_current_tile = map.local_to_map(position)
	var adjacencies = map.get_surrounding_cells(_current_tile)
	
	#are any mineable?
	for tile in adjacencies:
		if map.tile_is_mineable(tile):
			_mining_tile = tile
			return tile
		
	
	#get the first that is usable
	for tile in adjacencies:
		if !tile.x > map.mine_base.x && !tile.y > map.mine_base.y:
			return tile
	
	#used in error cases
	return Vector2i(0,0)

func check_time_home() -> bool:
	if speed * map_screen_manager.time_left/1000 <= abs(position.distance_to(map.map_to_local(map.mine_base))):
		return true
	return false
