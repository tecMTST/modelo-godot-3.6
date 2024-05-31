class_name ControleDeToque
extends Node

signal coordenadas_de_toque #(coordenadas)
signal toque_realizado
signal toque_desfeito

onready var viewport = $Viewport

var posicao_atual
var historico_de_toque = [PoolVector2Array()]
var viewport_modificador = viewport.size()

func _input(event):
	if event is InputEventScreenDrag:
		posicao_atual = event.get_position()
		if event.is_pressed():
			emit_signal("toque_realizado")
		else:
			emit_signal("toque_desfeito")

func _process(_delta):
	historico_de_toque.append(posicao_atual - viewport_modificador)
	if len(historico_de_toque) > 1:
		historico_de_toque.clear()

	print(historico_de_toque)
