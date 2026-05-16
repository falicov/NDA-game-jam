extends Button

@export var resourceName:String;
@export var amountDisplay:Label;
@export var priceDisplay:Label;

func _ready() -> void:
	amountDisplay.text = str(0);
	priceDisplay.text = GameManager

func increment() -> void:
	amountDisplay.text = str(GameManager.incrementResource(resourceName))
	pass
