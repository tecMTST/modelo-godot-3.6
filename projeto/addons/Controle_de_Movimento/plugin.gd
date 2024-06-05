tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("ControleDeMovimento", "Node", preload("res://addons/Controle_de_Movimento/movimento_celular.gd"), load("icon.svg"))


func _exit_tree():
	remove_custom_type("ControleDeMovimento")
