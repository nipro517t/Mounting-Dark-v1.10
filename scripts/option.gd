extends Control


func _ready() -> void:
	visible = true
	easy.grab_focus()
@onready var easy: Button = $MarginContainer/HBoxContainer/VBoxContainer/easy



func _process(_delta: float) -> void:
	
	Input.warp_mouse(Vector2(500,900))
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_start_pressed() -> void:

	get_tree().change_scene_to_file("res://scenes/jogo.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/hard.tscn")


func _on_quitgame_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")


func _on_opçao_pressed() -> void:
	await get_tree().create_timer(1.0).timeout
	visible = true
	easy.grab_focus()
