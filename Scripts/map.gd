extends TileMapLayer
class_name Map


@export var mine_base:Vector2i #should be bottom right of map

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func tile_is_mineable(coords:Vector2i) -> bool:
	print("checking if I can mine at " + str(coords))
	if(coords.x > mine_base.x || coords.y > mine_base.y):
		return false
	
	var tile = get_cell_tile_data(coords)
	for r in GameManager.resourceDict:
		if(tile.has_custom_data(r)):
			if(tile.get_custom_data(r) !=0):
				return true
	return false
