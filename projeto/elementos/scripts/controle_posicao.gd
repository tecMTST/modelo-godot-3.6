extends Node

onready var vbox_posicao = $VBoxContainer.rect_position

var toque_de_entrada = false

func _on_Controle_Toque_coordenadas_de_toque_y(coordenadas_y):
	if toque_de_entrada:
		vbox_posicao.y += (coordenadas_y[0] - coordenadas_y[1]) * .2
	print(coordenadas_y)

func _on_Controle_Toque_toque_realizado(foi_toque_realizado):
	toque_de_entrada = foi_toque_realizado
	print(toque_de_entrada)
func _on_Controle_Toque_toque_desfeito(foi_toque_realizado):
	toque_de_entrada = foi_toque_realizado
	print(toque_de_entrada)
