extends Area2D

var dados = {
	"nitrogenio" = 0, 
	"fosforo" = 0,
	"potassio" = 0,
	"umidade" = 0
	}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	dados["nitrogenio"] = rand.randf_range(0,1)
	dados["fosforo"] = rand.randf_range(0,1)
	dados["potassio"] = rand.randf_range(0,1)
	dados["umidade"] = rand.randf_range(0,1)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	Globais.solo_selecionado.emit(self)
	pass # Replace with function body.
