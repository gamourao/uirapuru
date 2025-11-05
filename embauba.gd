extends Node2D

enum GrowthStage { SEMENTE, BROTO, MUDA, JOVEM, ADULTA }

var dados = {"nome" : "EMBAÚBA",
			"estagio" : "SEMENTE"
			}

var current_stage: int = GrowthStage.SEMENTE
var growth_progress: float = 0.0
var growth_speed: float = 0.1  # Ajuste conforme necessário

func _ready():
	update_visual()

func _process(delta):
	if current_stage < GrowthStage.ADULTA:
		growth_progress += growth_speed * delta
		if growth_progress >= 1.0:
			growth_progress = 0.0
			current_stage += 1
			dados["estagio"] = str(current_stage)
			update_visual()

func update_visual():
	match current_stage:
		GrowthStage.SEMENTE:
			set_visual("   \n o \n   ")
		GrowthStage.BROTO:
			set_visual("   \n | \n o \n   ")
		GrowthStage.MUDA:
			set_visual("  O \n -|-\n  | \n")
		GrowthStage.JOVEM:
			set_visual(" \\|/ \n--O--\n /|\\ \n  |  \n")
		GrowthStage.ADULTA:
			set_visual("//|\\\\\n// O \\\\\n  /|\\ \n   |  \n")

func set_visual(ascii_art: String):
	# Aqui você atualiza o componente de texto do seu node
	# Dependendo de como você está renderizando o texto
	$TextLabel.text = ascii_art


func _on_area_2d_mouse_entered() -> void:
	Globais.planta_selecionada.emit(self)
	pass # Replace with function body.
