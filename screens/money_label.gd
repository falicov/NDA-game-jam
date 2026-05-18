extends Label

var money:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	money = GameManager.money
	text = "$" + str(money)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(GameManager.money != money):
		money = GameManager.money
		text = "$" + str(money)
	return
