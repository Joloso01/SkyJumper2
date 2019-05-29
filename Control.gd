extends Control


func _ready():
	pass 

func _on_jugar_pressed():
	get_tree().change_scene("res://instrucciones.tscn")
	
func _on_salir_pressed():
	get_tree().quit()


func _on_Label_gui_input(event):
	pass 
