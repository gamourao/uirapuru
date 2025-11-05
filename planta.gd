extends Label

var texto = ""

func _ready() -> void:
	Globais.planta_selecionada.connect(_muda_texto)

func _muda_texto(planta):
	#var nitrogenio = str("%0.2f" % solo.dados["nitrogenio"])
	#var fosforo = str(solo.dados["fosforo"])
	#var potassio = str(solo.dados["potassio"])
	#var humidade = str(solo.dados["umidade"])
	
	var texto = str("Planta: ", planta.dados["nome"], 
	"\nEstágio: ", planta.dados["estagio"])
	text = texto
