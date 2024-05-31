class_name ControleDeSwipe
extends Node

signal coordenadas_de_toque #(coordenadas)
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
			emit_signal("coordenadas_de_toque", historico_de_toque)
		else:
			emit_signal("toque_desfeito")

func _process(_delta):
	if posicao_atual != null:
		historico_de_toque.append(posicao_atual - viewport_modificador)
	if len(historico_de_toque) > 1:
		historico_de_toque.pop_front()

	print(historico_de_toque)
