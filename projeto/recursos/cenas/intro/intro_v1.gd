extends Control

func _ready() -> void:
	yield ($AnimationPlayer, 'animation_finished')
	_pular_intro()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_pular_intro()

func _pular_intro() -> void:
	# Exemplo: TrocadorDeCenas.trocar_cena("res://recursos/cenas/intro/intro2.tscn")
	pass
