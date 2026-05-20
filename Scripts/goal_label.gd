extends Label


func _on_tree_entered() -> void:
	text = "Goal: $" + str(GameManager.getCurrentGoal())
