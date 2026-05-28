extends CanvasLayer
@onready var re_zero: Button = $menuGameover/re_zero
@onready var score_label = $LabelPoints

func _ready():
	$death.play()
	re_zero.grab_focus()
	@warning_ignore("standalone_expression")
	score_label.text = "Pontos Totais: " + str(GameManager.final_points)

func _on_re_zero_pressed():
	##$audiobydeath.play()
	##await get_tree().create_timer($audiobydeath.stream.get_length()).timeout
	MusicaManager.death()
	get_tree().change_scene_to_file("res://scenes/hard.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")

func _on_quitgamer_pressed() -> void:
	get_tree().quit()
