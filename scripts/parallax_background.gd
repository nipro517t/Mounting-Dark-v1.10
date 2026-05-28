extends ParallaxBackground

var velocidade: int = 10 

func _process(delta: float) -> void:
	scroll_offset.y += velocidade * delta
