extends KinematicBody2D

const gravedad = 20
const velocidad = 100
const suelo = Vector2(0,-1)

var movimiento = Vector2()

var direccion = 1

func _ready():
	pass

func _physics_process(delta):
		movimiento.x = velocidad
		
		if direccion == 1:
			$Spritenemigo.flip_h = false
		else:
			$Spritenemigo.flip_h = true
			
			
			$Spritenemigo.play("caminando")
		
		movimiento.y += gravedad
		
		movimiento = move_and_slide(movimiento, suelo)
		
		if is_on_wall():
			direccion = direccion * -1
			$RayCast2D.position.x *= -1
		if $RayCast2D.is_colliding() == false:
			direccion = direccion * -1