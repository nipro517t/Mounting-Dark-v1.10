extends Control
@onready var button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Button


func _ready() -> void:
	$Pian.stream.loop = true
	GlobalSpeed.speedDown = 1.0
	GlobalSpeed.speedUp = 1.0
	button.grab_focus()
	Input.warp_mouse(Vector2(300, 400)) # posição que quiser



func _process(_delta: float) -> void:
	Input.warp_mouse(Vector2(500,900))
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/creditos.tscn")


func _on_quitgame_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/option.tscn")
