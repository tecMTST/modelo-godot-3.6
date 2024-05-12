class_name DialogoNPC
extends KinematicBody2D


export var id_dialogo: String = ""

func _physics_process(delta):
	pass




func _load_json(caminho: String):
	var json_arquivo := File.new()
	json_arquivo.open(caminho, File.READ)
	var conteudo = json_arquivo.get_as_text()
	json_arquivo.close()
	var parsed_json: JSONParseResult = JSON.parse(conteudo)
	if not parsed_json.error:
		return parsed_json.result
