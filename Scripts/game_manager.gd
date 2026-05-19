extends Node


#resources have a number of traits, I've made them an object to make things easier
class game_resource:
	var resourceName:String;
	var amount:int = 0;
	var value:int;
	#TODO: add options here for prices in non-monetary resources
	
	func _init(_resourceName:String, _value:int):
		resourceName = _resourceName
		value = _value

#allows for easy reference of objects
var resourceDict:Dictionary[String, game_resource] = {
	"coal":game_resource.new("coal", 1),
	"iron":game_resource.new("iron", 5),
	"copper":game_resource.new("copper", 10)
	}

var money:int = 20

#returns the current value of the resource
func incrementResource(resourceName:String) -> int:
	#handle when the player can't pay
	if(money < resourceDict[resourceName].value):
		return resourceDict[resourceName].amount
	
	money -= resourceDict[resourceName].value #maybe double this? would need associated UI
	resourceDict[resourceName].amount += 1
	return resourceDict[resourceName].amount

#returns the current value of the resource
func decrementResource(resourceName:String) -> int:
	#don't let the resource go negative
	if(resourceDict[resourceName].amount == 0):
		return 0
	
	money += resourceDict[resourceName].value
	resourceDict[resourceName].amount -= 1
	return resourceDict[resourceName].amount
