extends AnimatedSprite

func _on_player_anima_left():
	$".".play("left")

func _on_player_anima_right():
	$".".play("right")

func _on_player_anima_idle():
	$".".play("idle")
