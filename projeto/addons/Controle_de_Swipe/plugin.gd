tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("ControleDeSwipe", "Node", preload("res://addons/Controle_de_Swipe/controle_toque.gd"), preload("res://addons/Controle_de_Swipe/icon.svg"))


func _exit_tree():
	remove_custom_type("ControleDeSwipe")
