extends MeshInstance

var rotation3d = Vector3.ZERO

func _physics_process(delta):
	self.rotation_degrees = rotation3d
	
func _on_ControleDeMovimento_acelerometro(lista_acelerometro):
	rotation3d = lista_acelerometro

func _on_ControleDeMovimento_gyroscopio(lista_magnetometro):
	rotation3d = lista_magnetometro

func _on_ControleDeMovimento_magnetometro(lista_gyroscopio):
	rotation3d = lista_gyroscopio
