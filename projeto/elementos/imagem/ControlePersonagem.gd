class_name PlayerKinematico
extends KinematicBody2D


var vetor: Vector2 = Vector2.ZERO
var velocidade: int = 100

func _physics_process(delta):
	var direcao: Vector2 = Vector2.ZERO
	
	direcao.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direcao.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direcao = direcao.normalized()
	
	vetor = move_and_slide(direcao * velocidade)
