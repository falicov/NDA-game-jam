extends TileMapLayer
class_name Map


@export var mine_base:Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func tile_is_mineable(coords:Vector2i) -> bool:
	var tile = get_cell_tile_data(coords)
	for r in GameManager.resourceDict:
		var name = GameManager.resourceDict[r].resourceName
		if(tile.has_custom_data(name)):
			if(tile.get_custom_data(name) !=0):
				return true
	return false
