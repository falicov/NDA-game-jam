extends GridContainer

var buyable_sellable_obj = preload("res://UI_Objects/buyable_or_sellable_button.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for _resourceName in GameManager.resourceDict:
		var _instance = buyable_sellable_obj.instantiate()
		_instance.resourceName = _resourceName
		add_child(_instance)
		_instance.setup()
