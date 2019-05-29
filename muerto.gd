extends Node2D

func _ready():
	get_viewport().audio_listener_enable_2d = true
	$AudioStreamPlayer2D.play()
	$AudioStreamPlayer2D.volume_db

func _physics_process(delta):
	if(Input.is_action_just_pressed("tecla_m")): #reiniciar mundo
		get_tree().change_scene("res://mundo.tscn")