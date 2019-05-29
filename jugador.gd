extends KinematicBody2D
#Constantes para que funcione el juego
const arriba = Vector2(0,-1)
const VELOCIDAD = 210 #Para que camine el personaje
const GRAVEDAD = 420 #
const salto_altura = -210 #Fuerza para saltar
var movimiento = Vector2()
var salto_contador = 0 #Contador inicial de salto
const maximos_saltos_contador = 2
var on_ground = false #Esta tocando el suelo falso
export (PackedScene) var Proyectiles
var esta_atac = false
const flecha = preload("res://flecha.tscn")
var muerto = false
var puntos = 0
export var vida_maxima = 100
export var vida_actual = 100
export var buff_curacion = 1
var caida = false

var moneda_actual

var barra_vida



func _ready():
	set_physics_process(true)
	set_process(true)
	
	barra_vida = get_tree().get_nodes_in_group("hpj1")[0]
	
func _process(delta):
	var score = get_node("marcador/RichTextLabel")
	score.text = str(puntos)
		
	
	
func actualizar_barrahp():
	barra_vida.value = vida_actual * barra_vida.max_value / vida_maxima

func _physics_process(delta):
	
	actualizar_barrahp()
	vida_actual += buff_curacion * delta
	vida_actual = clamp(vida_actual, 0, vida_maxima)
	
	if muerto == false:
		
		movimiento.y += GRAVEDAD * delta #Fisicas de movimiento y caida
		
		if Input.is_action_pressed("ui_right"): #Movimiento a la derecha
			if esta_atac == false:
			
				movimiento.x = VELOCIDAD
				
				$AnimatedSprite.flip_h =false #Animacion sigue recta
				
				$AnimatedSprite.play("correr") #Pone la animacion Correr
			
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
	
		elif Input.is_action_pressed("ui_left"): #Movimiento a la a la izquierda
			if esta_atac == false:
				
				movimiento.x = -VELOCIDAD
				
				$AnimatedSprite.flip_h =true #Animacion cambia hacia atras
				
				$AnimatedSprite.play("correr")
			
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else:
			movimiento.x = 0
			if is_on_ceiling() && esta_atac == false:
			
				$AnimatedSprite.play("quieto") #Pone la animacion quieto
		
		if Input.is_action_just_pressed("ui_up"):
			if esta_atac == false:
				if salto_contador < 2:
					salto_contador += 1
					movimiento.y = salto_altura
					on_ground = false
					caida = false
				
		arriba.y += GRAVEDAD
		
		if Input.is_action_just_pressed("ui_accept") && esta_atac == false: # al darle al espacio sale la flecha
			esta_atac = true
			$AnimatedSprite.play("ataque") 
			var disparo = flecha.instance()
			if sign($Position2D.position.x) == 1:
				disparo.set_disparo_direccion(1)
			else:
				disparo.set_disparo_direccion(-1)
			get_parent().add_child(disparo)
			disparo.position = $Position2D.global_position
			
			
	
		if is_on_ceiling():
	#		on_ground = true
	#		salto_contador = 0
			if on_ground == false:
				on_ground = true
				salto_contador = 0
				print(on_ground)
		else:
			if esta_atac == false:
				on_ground = false
				if movimiento.y < 0:
					$AnimatedSprite.animation = "salto"
				else:
					$AnimatedSprite.animation = "caida"
	
		
	
		movimiento = move_and_slide(movimiento, arriba)
		
		if get_slide_count() > 1 :
			for i in range(get_slide_count()):
				if "enemy" in get_slide_collision(i).collider.name:
					vida_actual -= 6
					quitar_vida()
					
		
func quitar_vida():
	if barra_vida.value == 0:
		muerto()


func muerto():
	muerto = true
	movimiento = Vector2(0, 0)
	$AnimatedSprite.play("muerto")
	$CollisionShape2D.disabled = true
	$Timer.start()

func _on_AnimatedSprite_animation_finished():
	esta_atac = false

func _on_Timer_timeout():
	get_tree().change_scene("muerto.tscn")


func _on_suelo_body_entered(body):
	muerto()

func _on_moneda_1_body_entered(body):
	puntos += 2
	print(puntos)
	
func monedas_act():
	moneda_actual == puntos
	
