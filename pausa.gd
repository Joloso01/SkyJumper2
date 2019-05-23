extends Control

func _input(event):
	if event.is_action_pressed("tecla_esc"):
		var estado_pausa = not get_tree().paused
		
		get_tree().paused = estado_pausa
		visible = estado_pausa