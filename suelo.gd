extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var obj_colisionado = get_
	if(obj_colisionado.is_in_group("player")):
			get_tree().change_scene("res://muerto.tscn")
