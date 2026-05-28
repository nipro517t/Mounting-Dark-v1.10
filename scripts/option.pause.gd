extends CanvasLayer
@onready var easy: Button = $VBoxContainer/Resume


func _ready() -> void:
	visible = false


func _process(_delta: float) -> void:
	
	Input.warp_mouse(Vector2(500,900))
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		visible = true
		easy.grab_focus()

func _on_easy_pressed() -> void:
	get_tree().paused = false 
	visible = false

func _on_dificult_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
	

func _on_quitgame_pressed() -> void:
	get_tree().quit()
