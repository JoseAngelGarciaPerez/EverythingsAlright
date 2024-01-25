class_name Vela
extends Node3D
# Called when the node enters the scene tree for the first time.

@onready var jugador = get_node("/root/Main/Jugador")
@onready var escenaVela = preload("res://Recursos/Objetos/Vela.tscn")
@onready var vela  = get_parent().get_parent().get_parent()

func pick_up():
	vela.queue_free()
	var instanceVela = escenaVela.instantiate()
	instanceVela.get_node("vela/Cilindro/StaticBody3D/CollisionShape3D").disabled = true
	jugador.get_node("Camera3D/Mano").add_child(instanceVela)

