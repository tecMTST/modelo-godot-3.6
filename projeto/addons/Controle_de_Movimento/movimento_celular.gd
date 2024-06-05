extends Node

signal acelerometro
signal magnetometro
signal gyroscopio


onready var acelerometro
onready var magnetometro
onready var gyroscopio

var lista_acelerometro = []
var lista_magnetometro = []
var lista_gyroscopio = []

var controle_atual

func _ready():
	acelerometro = Input.get_accelerometer()
	magnetometro = Input.get_magnetometer()
	gyroscopio = Input.get_gyroscope()
	if acelerometro != Vector3(0,0,0):
		controle_atual = "acelerometro"
		print(acelerometro)
		print('dispositivo acelerometro conectado')
	elif magnetometro != Vector3(0,0,0):
		controle_atual = "magnetometro"
		print('dispositivo magnetometro conectado')
	elif gyroscopio != Vector3(0,0,0):
		controle_atual = "gyroscopio"
		print('dispositivo gyroscopio conectado')
	else:
		print('não há nenhum dispositivo conectado')

func _input(event):
	if event is InputEvent:
		acelerometro = Input.get_accelerometer()
		magnetometro = Input.get_magnetometer()
		gyroscopio = Input.get_gyroscope()
		append_listas()

func append_listas():
	match controle_atual:
		"acelerometro":
			lista_acelerometro.append(acelerometro.x, acelerometro.y, acelerometro.z)
			emit_signal("acelerometro", lista_acelerometro)
		"magnetometro":
			lista_magnetometro.append(magnetometro.x, magnetometro.y, magnetometro.z)
			emit_signal("magnetometro", lista_magnetometro)
		"gyroscopio":
			lista_gyroscopio.append(gyroscopio.x, gyroscopio.y, gyroscopio.z)
			emit_signal("gyroscopio", lista_gyroscopio)
