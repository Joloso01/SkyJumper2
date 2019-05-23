extends Area2D

export(String, FILE, "*.tscn") var mapa_select

func _ready():
	pass # Replace with function body.



func _on_CambioNivel_body_entered(body):
	if "jugador" in body.name:
		get_tree().change_scene(mapa_select)