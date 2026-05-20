extends Panel
class_name BuyableSellableButton

@export_category("all must be filled!")
@export var resourceName:String;
@export var amountDisplay:Label;
@export var priceDisplay:Label;
@export var nameDisplay:Label;
var sellable:bool
@export var sellButton:Button;

#must be instantiated by its column!
#if you try to make one of these by themself there will be a bug. see buy_column
#or run setup() some other way
func setup() -> void:
	amountDisplay.text = str(GameManager.resourceDict[resourceName].amount);
	priceDisplay.text = "$"+str(GameManager.resourceDict[resourceName].value)
	nameDisplay.text = resourceName.capitalize()
	sellable = GameManager.resourceDict[resourceName].sellable
	if(!sellable):
		sellButton.free()
	hide()
	if resourceName != null && GameManager.resourceDict[resourceName].amount > 0:
		show()

func _on_tree_entered() -> void:
	if resourceName != null && GameManager.resourceDict[resourceName].amount > 0:
		show()
		amountDisplay.text = str(GameManager.resourceDict[resourceName].amount)

func increment() -> void:
	amountDisplay.text = str(GameManager.buyResource(resourceName))
	pass

func decrement() -> void:
	amountDisplay.text = str(GameManager.sellResource(resourceName))
	pass
