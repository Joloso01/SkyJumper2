extends Node

var vidas_j1 = 3 #numero de vidas visualizadas
var offset_vidas = 50 #separacion entre las vidas
var lista_vidas = []
export (PackedScene) var spr_vidas

func _ready():
	get_viewport().audio_listener_enable_2d = true
	$AudioStreamPlayer2D.play()
	
    
func crear_vidas():
    for i in vidas_j1: #con esta funcion hacemos que se repita el icono vida
        var newVida = spr_vidas.instance()
        get_tree().get_nodes_in_group("VIDA")[0].add_child(newVida)
        newVida.global_position.x += offset_vidas * i #La “i” es para que se multiplique por el valor inicial 
        lista_vidas.append(newVida)
        
func quitar_vida():
        vidas_j1 -= 1
        lista_vidas[vidas_j1].queue_free()
	
#mirar vida
        #Para quitar vida
func agregar_vida():
        vidas_j1 += 1
        var newVida = spr_vidas.intance()
        get_tree().get_nodes_in_group("VIDA")[0].add_child(newVida)
        newVida.global_position.x += offset_vidas * (vidas_j1 - 1)
        lista_vidas[vidas_j1-1].append(newVida)
        #para agregar vida
