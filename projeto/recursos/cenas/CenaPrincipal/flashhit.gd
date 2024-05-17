extends Sprite

func _ready():
	# Inicia a cena chamando a si mesmo o material como um shader material
	var shader_material = self.material as ShaderMaterial


func _on_TouchScreenButton_pressed(shader_material):
	print('apertado')
	shader_material.set_shader_param("ativo", true)


func _on_TouchScreenButton_released(shader_material):
	# Desativa o efeito de piscar após 5 segundos
	yield(get_tree().create_timer(5.0), "timeout")
	shader_material.set_shader_param("ativo", false)
