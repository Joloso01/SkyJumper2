extends CanvasLayer
var vidas = 2


func _process(delta):
	
		
	if get_parent().get_node("jugador").get_slide_count() > 0 :
			for i in range(get_parent().get_node("jugador").get_slide_count()):
				if "enemy" in get_parent().get_node("jugador").get_slide_collision(i).collider.name:
					vidas -= 1
		
	if vidas == 2:
		$vida1.frame = 0
		$vida2.frame = 0
	elif vidas == 1:
		$vida2.frame = 1
	elif vidas == 0:
		$vida1.frame = 1
		
	if vidas == 0:
		get_parent().get_node("jugador").muerto()
		