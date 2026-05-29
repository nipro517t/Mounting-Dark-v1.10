extends Node2D


func _ready() -> void:
	$Fireforce.stream.loop = true
	await get_tree().create_timer(1.0).timeout
	$Fireforce.play()

@onready var score: Label = $Score


func _process(_delta: float) -> void:
	pass

const PLATE_SCENE = preload("res://scenes/plate.tscn")
const THE_ROCK_SCENE = preload("res://scenes/the_rock.tscn")
const COIN_SCENE = preload("res://scenes/coin.tscn")
const WARNING_SCENE = preload("res://scenes/warning.tscn")

var points = 0

@export var label: Label

func _on_heroi_2_game_over() -> void:
	print("game over")
	GameManager.total_points = points
	GameManager.final_points += points
	GlobalSpeed.speedDown = 1.0
	GlobalSpeed.speedUp = 1.0
	call_deferred("_trocar_cena")

	
func _trocar_cena():
	var caminho = get_tree().current_scene.scene_file_path
	if caminho == "res://scenes/jogo.tscn":
		get_tree().change_scene_to_file("res://scenes/gameOver.tscn")

	elif caminho == "res://scenes/hard.tscn":
		get_tree().change_scene_to_file("res://scenes/hard.gameOver.tscn")


func _on_timer_plate_timeout() -> void:
	var plate: Node2D = PLATE_SCENE.instantiate()
	var coin_plate = randf_range(770, 128)
	plate.position = Vector2(coin_plate , 0)
	
	var coin_spawn = randi_range(4, 0)
	var coin: Node2D = COIN_SCENE.instantiate()
	add_child(plate)
	
	if coin_spawn == 4:
		print("coin")
		
		await get_tree().create_timer(1.0).timeout
		add_child(coin)
	coin.position = Vector2(coin_plate , 0)
	
	
	
 
func _on_timer_rock_timeout() -> void:
	var the_rock: Node2D = THE_ROCK_SCENE.instantiate()
	var warning: Node2D = WARNING_SCENE.instantiate()
	
	var warning_rock = randf_range(872, 24)
	
	warning.position = Vector2(warning_rock, 25)
	add_child(warning)
	await get_tree().create_timer(1.3 * GlobalSpeed.speedDown).timeout
	the_rock.position = Vector2(warning_rock, 0)
	
	add_child(the_rock)
	

func _on_timer_score_timeout() -> void:
	points += 10
	score.text = "Score: " + str(points)

func _on_heroi_2_score() -> void:
	points += 100


func _on_timer_speed_timeout() -> void:
	GlobalSpeed.speedUp = clamp(GlobalSpeed.speedUp + 0.3, 0.0, 5.0)
	GlobalSpeed.speedDown = clamp(GlobalSpeed.speedDown * 0.85, 0.2, 1.0)
	
	for timer in get_tree().get_nodes_in_group("Timers"):
		if timer is Timer:
			if not timer.has_meta("original_time"):
				timer.set_meta("original_time", timer.wait_time)
			
			var base_time: float = timer.get_meta("original_time")
			timer.wait_time = base_time * GlobalSpeed.speedDown
