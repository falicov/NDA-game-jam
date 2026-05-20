extends AnimatedSprite2D

@export var map:Map
@export var map_screen_manager:MapScreenManager

var _current_tile:Vector2i
var mining_tile:Vector2i

#move speed
var _speed = 100 #per second

var _resource_dict:Dictionary[String, int]
var _time_to_mine = 0
#these 3 must be reset after each tile
var _holding_resources:bool
var _time_mined = 0
#there are 5 stages as of right now
var anim_stage:int = 0




func _ready() -> void:
	GameManager.miners.append(self)
	for r in GameManager.resourceDict:
		_resource_dict.set(r, 0)

func _process(delta: float) -> void:
	#check if we aren't supposed to be doing anything
	if(map_screen_manager == null || !map_screen_manager.map_playing 
	|| map == null):
		get_parent().remove_child(self)
		return
	
	
	#note that this section also depends on scene architecture!
	#figure out where to move
	if(check_time_home()):
		#first, check if we just want to head back to base
		_current_tile = map.mine_base
	elif(_current_tile != mining_tile && _current_tile != map.mine_base || _current_tile == Vector2i(0,0)):
		#if we don't already have a spot to mine, find one
		if(mining_tile != Vector2i(0,0)):
			# go to the tile I was mining. it must be reset when done.
			_current_tile = mining_tile
		else:
			if(_current_tile != Vector2i(0,0) && map.tile_is_mineable(_current_tile)):
				#set to mining tile!
				mining_tile = _current_tile
			elif(_current_tile == Vector2i(0,0) || _current_tile== map.local_to_map(position)):
				#look around me for mineable tiles
				_current_tile = next_tile()
		print(_current_tile)
		
	#mine a tile
	if(map.local_to_map(position) == mining_tile && _current_tile == mining_tile):
		print("I'm mining!")
		#if this doesn't work... there's some problem with the tiles
		var tile_data:TileData = map.get_cell_tile_data(mining_tile)
		if(!_holding_resources):
			for r in _resource_dict:
				_resource_dict[r]=tile_data.get_custom_data(r)
			_holding_resources = true
			_time_to_mine = tile_data.get_custom_data("mine_time")
		
		#now mine it!
		_time_mined += delta
		
		#animate the tile being mined
		#this section in particular is deeply hardcoded
		# & based on the art I did
		#notice how the animation goes linearly down for the first 3 cells
		if ((_time_mined >= _time_to_mine/5 && anim_stage == 0) 
		|| (_time_mined >= _time_to_mine*2/5 && anim_stage == 1) 
		|| (_time_mined >= _time_mined*3/5 && anim_stage == 2)):
			var source_id = map.get_cell_source_id(mining_tile)
			var atlas_coords = map.get_cell_atlas_coords(mining_tile)
			map.set_cell(mining_tile, source_id, Vector2i(atlas_coords.x, atlas_coords.y+1))
			anim_stage+=1
		elif _time_mined >= _time_to_mine*4/5 && anim_stage == 3:
			var source_id = map.get_cell_source_id(mining_tile)
			map.set_cell(mining_tile, source_id, map.ALMOST_MINED_COORDS)
		#head back when done
		if(_time_mined >= _time_to_mine):
			var source_id = map.get_cell_source_id(mining_tile)
			map.set_cell(mining_tile, source_id, map.MINED_COORDS)
			_current_tile = map.mine_base
			#could change later if we want miners to take multiple trips
			#carrying resources
			mining_tile = Vector2i(0,0)
			anim_stage = 0
			_time_mined = 0
		
	elif _current_tile == map.mine_base && map.local_to_map(position) == map.mine_base:
		#if we're at base, drop off resources and head out for more
		if(_holding_resources):
			for r in _resource_dict:
				GameManager.resourceDict[r].amount += _resource_dict[r]
				_resource_dict[r] = 0
			_holding_resources = false
		_current_tile = Vector2i(0,0)
	else: #or move
		var dist_to_tile = map.map_to_local(_current_tile) - position
		position += delta * _speed * dist_to_tile/dist_to_tile.length()


func next_tile() -> Vector2i:
	if _current_tile == Vector2i(0,0):
		_current_tile = map.local_to_map(position)
	var adjacencies:Array = map.get_surrounding_cells(_current_tile)
	
	#are any mineable?
	for tile in adjacencies:
		if map.tile_is_mineable(tile):
			mining_tile = tile
			return tile
		
	
	#get the first that is usable
	while true:
		var tile = adjacencies[randi() % adjacencies.size()]
		if !tile.x > map.mine_base.x && !tile.y > map.mine_base.y:
			return tile
	
	#used in error cases
	return Vector2i(0,0)

func check_time_home() -> bool:
	if _speed * map_screen_manager.time_left/1000 <= abs(position.distance_to(map.map_to_local(map.mine_base))):
		return true
	return false
