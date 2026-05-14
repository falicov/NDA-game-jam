extends Button

@export var resourceName:String;

func _pressed() -> void:
	text = resourceName + ": " + str(GameManager.incrementResource(resourceName))
	pass
