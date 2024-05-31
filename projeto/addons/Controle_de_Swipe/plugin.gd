tool
extends EditorPlugin

func _enter_tree():
	var ControleDeSwipe = preload("res://addons/Controle_de_Swipe/Controle_Toque.tscn")
	add_custom_type("ControleDeSwipe", "Node2D", preload("res://addons/Controle_de_Swipe/controle_toque.gd"), preload("res://addons/Controle_de_Swipe/Group 8.svg"))


func _exit_tree():
	remove_custom_type("ControleDeSwipe")
