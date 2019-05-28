 extends KinematicBody2D

const VELOCIDAD = 120 #Para que camine el personaje
const GRAVEDAD = 410 #
var movimiento = Vector2()
const techo = Vector2(0,-1)
export(int) var hp = 1

var direccion = 1

var muerto = false

func dead():
	hp = hp - 1
	
	if hp <= 0:
		muerto = true
		movimiento = Vector2(0, 0)
		$AnimatedSprite.play("muerto")
		$CollisionShape2D.disabled = true
		$Timer.start()
		

func _physics_process(delta):	
	if muerto == false:
		movimiento.x=VELOCIDAD * direccion
		
		if direccion == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
			
		$AnimatedSprite.play("correr")
		
		movimiento.y += GRAVEDAD
		
		movimiento = move_and_slide(movimiento, techo)
		
		if is_on_wall():
			direccion = direccion * -1
			$RayCast2D.position.x *= -1
		
		if $RayCast2D.is_colliding() == false:
			direccion = direccion * -1
			$RayCast2D.position.x *= -1
		
		if get_slide_count() > 0:
			for i in range (get_slide_count()):
				if "player" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.dead()
		
#		add_collision_exception_with(self)

#		var obj_colisionado = get_slide_collision(get_slide_count()-1).collider
#		if(obj_colisionado.is_in_group("player")):
#			get_tree().change_scene("res://muerto.tscn")
#		queue_free()

func _on_Timer_timeout():
	queue_free()
