extends Node2D

var ano = 0 #20 anos ao todo; um minuto por ano
var tempo = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tempo += delta
	pass


func _on_passa_ano_timeout() -> void:
	ano += 1
	pass # Replace with function body.
