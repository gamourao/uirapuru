extends Node

signal solo_selecionado(solo)
signal planta_selecionada(planta)
signal planta_atualiada(planta)
signal solo_atualizado(solo)

var tempo : float = 365.0 / 60
var dia : float
var ano : int
var estacao : String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dia += tempo * delta
	if dia >= 365:
		ano += 1
		dia = 0

	if dia <= 79:
		estacao = "VERÃO"	
	elif dia <= 150:
		estacao = "OUTONO"
	elif dia <= 242:
		estacao = "INVERNO"
	elif dia <= 333:
		estacao = "PRIMAVERA"
	else:
		estacao = "VERÃO"
