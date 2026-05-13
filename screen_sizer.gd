extends HBoxContainer
var screenSize;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#resize everything to be big
	screenSize = get_viewport().get_visible_rect().size
	size.x = screenSize.x
	size.y = screenSize.y
	for subnode in get_children():
		subnode.size.x = size.x/get_child_count()
		subnode.size.y = size.y
		print(subnode.size.x)
		print(subnode.name)
