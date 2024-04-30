# Classe de Maquina de Estado.
# Adaptada de https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/
class_name MaquinaDeEstado
extends Node


# Sinal emitido após transição de estado.
signal transicionado(nome_estado)

# Caminho para estado inicial.
export var estado_inicial := NodePath()

# Estado ativo.
onready var estado: Estado = get_node(estado_inicial)


func _ready() -> void:
	yield(owner, "ready")
	# The state machine assigns itself to the State objects' state_machine property.
	for crianca in get_children():
		crianca.maquina_de_estado = self
	estado.entrar()


# The state machine subscribes to node callbacks and delegates them to the state objects.
func _unhandled_input(evento: InputEvent) -> void:
	estado.manipular_entrada(evento)


func _process(delta: float) -> void:
	estado.atualizar(delta)


func _physics_process(delta: float) -> void:
	estado.atualizar_fisica(delta)


# This function calls the current state's exit() function, then changes the active state,
# and calls its enter function.
# It optionally takes a `msg` dictionary to pass to the next state's enter() function.
func transicionar(novo_estado: String, params: Dictionary = {}) -> void:
	# Safety check, you could use an assert() here to report an error if the state name is incorrect.
	# We don't use an assert here to help with code reuse. If you reuse a state in different state machines
	# but you don't want them all, they won't be able to transition to states that aren't in the scene tree.
	if not has_node(novo_estado):
		return

	estado.sair()
	estado = get_node(novo_estado)
	estado.entrar(params)
	emit_signal("transicionado", estado.name)
