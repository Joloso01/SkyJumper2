extends Area2D

const velocidad = 400
var movimiento = Vector2()
var direccion = 1

func set_disparo_direccion(dir):
	direccion = dir
	if dir == -1:
		$Sprite.flip_h = true

func _physics_process(delta):
	movimiento.x = velocidad * delta * direccion
	translate(movimiento)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if "enemy" in body.name:
		body.dead()
	queue_free()
