extends Node

#resources have a number of traits, I've made them an object to make things easier
class gameResource:
	var resourceName:String;
	var amount:int = 0;
	var value:int;
	#TODO: add options here for prices in non-monetary resources
	
	func _init(_resourceName:String, _value:int):
		resourceName = _resourceName
		value = _value

#allows for easy reference of objects
var resourceDict:Dictionary[String, gameResource] = {
	"coal":gameResource.new("coal", 1),
	"iron":gameResource.new("iron", 5),
	"silver":gameResource.new("silver", 10)
	}

var money:int = 0;

#returns the current value of the resource
func incrementResource(resourceName:String) -> int:
	if(money < resourceDict[resourceName].value):
		pass
	
	money -= resourceDict[resourceName].value
	resourceDict[resourceName].amount += 1
	return resourceDict[resourceName].amount
