extends Button

var dados = {
	"nitrogenio" = 0, 
	"fosforo" = 0,
	"potassio" = 0,
	"humidade" = 0
	}



func _on_pressed() -> void:
	Globais.solo_selecionado.emit(self)
	pass # Replace with function body.
