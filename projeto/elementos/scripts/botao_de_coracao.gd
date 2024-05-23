extends TextureRect

onready var sprite_coracao: AnimatedSprite = $AnimatedSprite
var apertado: bool = false
var foi_ativado: bool = false

func _process(delta):
	if apertado and foi_ativado == false:
		sprite_coracao.play('animacao')
	elif apertado and foi_ativado:
		sprite_coracao.play('animacao', true)
	else:
		pass

func _on_CheckBox_pressed():
	apertado = true
