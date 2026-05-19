extends AnimatedSprite2D

@export var map:TileMapLayer
@export var map_screen_manager:Node2D



func _process(delta: float) -> void:
	if(map_screen_manager.map_playing):
		show()
		if()
