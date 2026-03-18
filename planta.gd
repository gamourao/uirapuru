extends Label

var texto = ""
var planta : Node

func _ready() -> void:
	Globais.planta_selecionada.connect(_muda_planta)
	Globais.planta_atualiada.connect(_muda_texto)

func _muda_planta(selecionada):
	planta = selecionada
	_muda_texto(planta)
	pass

func _muda_texto(atualizado):
	#var nitrogenio = str("%0.2f" % solo.dados["nitrogenio"])
	#var fosforo = str(solo.dados["fosforo"])
	#var potassio = str(solo.dados["potassio"])
	#var humidade = str(solo.dados["umidade"])
	if atualizado == planta:
		var texto = str("Planta: ", planta.dados["nome"], 
		"\nEstágio: ", planta.dados["estagio"])
		text = texto
