extends Area2D

enum estados {quieto}
var estado_actual = estados
var velocidad = 0
func _ready():
	estado_actual = estados.quieto
	get_node("AnimationPlayer").play("quieto")

func _on_moneda_1_body_entered(body):
	queue_free()
