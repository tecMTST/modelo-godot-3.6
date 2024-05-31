class_name ControleDeSwipe
extends Node

signal coordenadas_de_toque_y #(coordenadas y)
signal coordenadas_de_toque_x #(coordenadas x)
signal toque_realizado
signal toque_desfeito

export var tamanho_array = 2

onready var viewport_modificador = get_viewport().get_visible_rect().size * .2

var posicao_atual
var historico_de_toque_x = []
var historico_de_toque_y = []
var foi_toque_realizado = false

func _input(event):
	if event is InputEventScreenDrag:
		posicao_atual = (event.get_position() - viewport_modificador)

		if event.is_pressed():
			historico_de_toque_y.append(int(posicao_atual.y))
			historico_de_toque_x.append(int(posicao_atual.x))
			foi_toque_realizado = true

		else:
			historico_de_toque_y.append(int(posicao_atual.y))
			historico_de_toque_x.append(int(posicao_atual.x))
			foi_toque_realizado = false

func _process(_delta):
	if len(historico_de_toque_x) > tamanho_array:
		historico_de_toque_x.pop_front()
	if len(historico_de_toque_y) > tamanho_array:
		historico_de_toque_y.pop_front()

	emit_signal("toque_realizado", foi_toque_realizado)
	emit_signal("toque_desfeito", foi_toque_realizado)
	emit_signal("coordenadas_de_toque_x", historico_de_toque_x)
	emit_signal("coordenadas_de_toque_y", historico_de_toque_y)

	$Label.text = "x=" + String(historico_de_toque_x) + " y=" + String(historico_de_toque_y)
















""" segunda maneira de fazer
class_name ControleDeSwipe
extends Node

signal coordenadas_de_toque_y #(coordenadas)
signal coordenadas_de_toque_x #(coordenadas)
signal toque_realizado
signal toque_desfeito

onready var viewport_modificador = $Viewport.get_visible_rect().size * .5

var posicao_atual
var historico_de_toque = [PoolVector2Array()]

func _input(event):
	if event is InputEventScreenDrag:
		posicao_atual = event.get_position()
		if event.is_pressed():
			emit_signal("toque_realizado")
			emit_signal("coordenadas_de_toque_x", historico_de_toque)
		else:
			emit_signal("toque_desfeito")

func _process(_delta):
	if posicao_atual != null:
		historico_de_toque.append(posicao_atual - viewport_modificador)
	if len(historico_de_toque) > 5:
		historico_de_toque.pop_front()

	print(historico_de_toque)
"""
