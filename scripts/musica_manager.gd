extends Node
var audiobydeath: AudioStreamPlayer

func _ready():
	audiobydeath = AudioStreamPlayer.new()
	add_child(audiobydeath)
	audiobydeath.stream = preload("res://assets/sons/return.ogg")  
	audiobydeath.volume_db = -10
func death():
	
	audiobydeath.play()
	print("sinal")
