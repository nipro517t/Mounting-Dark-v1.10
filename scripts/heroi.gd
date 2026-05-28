extends CharacterBody2D

@onready var animated_spite = $AnimatedSprite2D

var max_jump = -900
var max_X_speed = 800
signal game_over
signal score
const SPEED = 450.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	
	if not is_on_floor ():
		velocity += get_gravity() * delta
		
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = clamp(JUMP_VELOCITY * GlobalSpeed.speedUp, max_jump, 0)
		animated_spite.play("Jump")
	
	if Input.is_action_pressed("fall"):
		velocity.y = -JUMP_VELOCITY * GlobalSpeed.speedUp
		animated_spite.play("Fall")
		
	
	
	
	
	elif Input.is_action_pressed("left"):
		velocity.x = clamp(-SPEED * GlobalSpeed.speedUp, -max_X_speed, 0)
		$AnimatedSprite2D.flip_h = true
		if is_on_floor():
			$AnimatedSprite2D.flip_h = true
			animated_spite.play("Walk")
		else:
			animated_spite.play("Fall")
	
	elif Input.is_action_pressed("right"):
		velocity.x = clamp(SPEED * GlobalSpeed.speedUp, 0, max_X_speed)
		$AnimatedSprite2D.flip_h = false
		if is_on_floor():
			$AnimatedSprite2D.flip_h = false
			animated_spite.play("Walk")
		else:
			animated_spite.play("Fall")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			animated_spite.play("Idle")
		
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("moeda"):
		score.emit()
		area.visible = false
		area.get_parent().call_deferred("queue_free")
		
	else:
		game_over.emit()
