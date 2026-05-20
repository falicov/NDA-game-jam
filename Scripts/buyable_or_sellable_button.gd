extends Panel

@export_category("all must be filled!")
@export var resourceName:String;
@export var amountDisplay:Label;
@export var priceDisplay:Label;
@export var nameDisplay:Label;

#must be instantiated by its column!
#if you try to make one of these by themself there will be a bug. see buy_column
#or run setup() some other way
func setup() -> void:
	amountDisplay.text = str(0);
	priceDisplay.text = "$"+str(GameManager.resourceDict[resourceName].value)
	nameDisplay.text = resourceName.capitalize()

func increment() -> void:
	amountDisplay.text = str(GameManager.buyResource(resourceName))
	pass

func decrement() -> void:
	amountDisplay.text = str(GameManager.buyResource(resourceName))
	pass
