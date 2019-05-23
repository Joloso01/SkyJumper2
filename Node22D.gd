extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/ColorRect/VBoxContainer/continuar.grab_focus()

func _physics_process(delta):
	if $Control/ColorRect/VBoxContainer/continuar.is_hovered() == true:
		$Control/ColorRect/VBoxContainer/continuar.grab_focus()
	if $Control/ColorRect/VBoxContainer/salir.is_hovered() == true:
		$Control/ColorRect/VBoxContainer/salir.grab_focus()
	
	
	
func _input(event):
		if event.is_action_pressed("tecla_esc"):
				$Control/ColorRect/VBoxContainer/continuar.grab_focus() #para que cuando este pausado salga esto delante
				get_tree().paused =  not get_tree().paused #para pausar el juego
				visible = not visible

func _on_continuar_pressed():
	get_tree().paused =  not get_tree().paused #para pausar el juego
	visible = not visible


func _on_salir_pressed():
	get_tree().quit()
