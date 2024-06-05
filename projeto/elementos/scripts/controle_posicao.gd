extends Node

onready var vbox_posicao = $VBoxContainer.rect_position

var toque_de_entrada = false
var y_1
var y_2

func _on_Controle_Toque_coordenadas_de_toque_y(coordenadas_y):
	y_1 = coordenadas_y.front()
	y_2 = coordenadas_y.back()
	var calculo = y_1 - y_2
	if toque_de_entrada:
		vbox_posicao.y *= calculo
	print(coordenadas_y)

func _on_Controle_Toque_toque_realizado(foi_toque_realizado):
	toque_de_entrada = foi_toque_realizado
	print(toque_de_entrada)
func _on_Controle_Toque_toque_desfeito(foi_toque_realizado):
	toque_de_entrada = foi_toque_realizado
	print(toque_de_entrada)
