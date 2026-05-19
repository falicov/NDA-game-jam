extends TileMapLayer

class _tile:
	var coal
	var iron
	var copper
	
	func _init(_coal:int, _iron:int, _copper:int):
		coal = _coal
		iron = _iron
		copper = _copper

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
