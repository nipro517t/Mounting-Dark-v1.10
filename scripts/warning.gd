extends Node2D


func _ready() -> void:
	$AnimatedSprite2D.play("warning")


func _on_timer_timeout() -> void:
	queue_free()
