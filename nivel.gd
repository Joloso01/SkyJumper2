extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _process(delta):
		var cpos = $TileMap.world_to_map($jugador.position)
		$CanvasLayer/TilePos.text = str(cpos)
		
func _on_Character_collided(collision):
	
	if collision.collider is TileMap:
		var tile_pos = collision.collider.world_to_map($jugador.position)
		tile_pos -= collision.normal
		var tile = collision.collider.get_cellv(tile_pos)
		if tile > 0:
			$TileMap.set_cellv(tile_pos, tile-1)	
	
func _on_Ball_collided(Collider,pos,normal):
	pass