extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().audio_listener_enable_2d = true
	$AudioStreamPlayer2D.play()
	$AudioStreamPlayer2D.volume_db

func _input(event):
	pass

func _physics_process(delta):
	if(Input.is_action_just_pressed("tecla_m")): #reiniciar mundo
		get_tree().change_scene("res://mundo.tscn")