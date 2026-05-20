extends Button

@export var endDayStuff:Panel
@export var endDayText:Label

func pressed() ->void:
	if(GameManager.money >= GameManager.getCurrentGoal()):
		endDayText.text = ("You made $" + str(GameManager.money) +  
		" which meets the goal")
	else:
		endDayText.text = ("You made $" + str(GameManager.money) +  
		" which didn't meet the goal")
	endDayStuff.show()
