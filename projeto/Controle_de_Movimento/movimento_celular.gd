extends Node

signal _movimento(conversao_2d)

#onready var magnetometro
onready var acelerometro
var conversao_2d

func _physics_process(_delta):
	acelerometro = Input.get_accelerometer()
	
	conversao_2d = atan2(acelerometro.x, acelerometro.y)
	
