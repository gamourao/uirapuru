extends Node2D

var estagio_crescimento = [["SEMENTE", 0.2], ["BROTO", 0.3], ["MUDA", 0.5], ["JOVEM", 1], ["ADULTA", 8]]

var grafico = [
			"   \n o \n   ",
			"   \n | \n o \n   ",
			"  O \n -|-\n  | \n",
			" \\|/ \n--O--\n /|\\ \n  |  \n",
			"//|\\\\\n// O \\\\\n  /|\\ \n   |  \n",
			"><"
			]

var dados = {
			"nome" : "EMBAÚBA",
			"estagio" : "SEMENTE"
			}

var solo_em_que_esta = {}

var estagio_atual: int = 0
var growth_progress: float = 0.0
var velocidade_crescimento: float  # Ajuste conforme necessário
var influencia_do_solo: float 

@export var idade_adulta = 4
var morte = false

func _ready():
	update_visual()
	var variacao_velocidade = randf_range(0.8,1.2)
	velocidade_crescimento = 1.0 / 60.0 * variacao_velocidade

func _process(delta):
	cresce(delta)

func cresce(delta):
	if not morte:
		_pega_dados_solo()
		growth_progress += (velocidade_crescimento + influencia_do_solo) * delta 
		if growth_progress >= estagio_crescimento[estagio_atual][1]:
			growth_progress = 0.0
			estagio_atual += 1
			if estagio_atual + 1 <= estagio_crescimento.size():
				dados["estagio"] = estagio_crescimento[estagio_atual][0]
				Globais.planta_atualiada.emit(self)
			else:
				morte = true
				dados["estagio"] = "MORTA"
			
			update_visual()
				
			
func update_visual():
	$TextLabel.text = grafico[estagio_atual]


func _on_area_2d_mouse_entered() -> void:
	Globais.planta_selecionada.emit(self)
	pass # Replace with function body.

func _pega_dados_solo():
	if solo_em_que_esta.size() > 1:
		influencia_do_solo = 0.25 * solo_em_que_esta["nitrogenio"] * solo_em_que_esta["fosforo"] * solo_em_que_esta["potassio"] * solo_em_que_esta["umidade"]
		
