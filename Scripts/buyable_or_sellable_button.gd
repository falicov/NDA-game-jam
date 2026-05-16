extends Panel

@export var resourceName:String;
@export var amountDisplay:Label;
@export var priceDisplay:Label;
@export var nameDisplay:Label;

func _ready() -> void:
	amountDisplay.text = str(0);
	print(GameManager.resourceDict[resourceName])
	priceDisplay.text = "$"+str(GameManager.resourceDict[resourceName].value)
	nameDisplay.text = resourceName.capitalize()

func increment() -> void:
	amountDisplay.text = str(GameManager.incrementResource(resourceName))
	pass

func decrement() -> void:
	amountDisplay.text = str(GameManager.decrementResource(resourceName))
	pass
