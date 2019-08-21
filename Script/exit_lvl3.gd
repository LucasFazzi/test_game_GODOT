extends Area2D

func _ready():
	$".".add_to_group("exit")
	pass


func _on_exit_body_entered(body):
	if body.is_in_group("player"):
		if $exit.is_playing():
			pass
		if not $exit.is_playing():
			$exit.play()
		var waiting_timer = Timer.new()
		waiting_timer.set_wait_time(0.3)
		waiting_timer.set_one_shot(true)
		self.add_child(waiting_timer)
		waiting_timer.start()
		yield(waiting_timer, "timeout")
		get_tree().call_deferred("change_scene","res://Scenes/lvl4.tscn")
		call_deferred("queue_free")
	else:
		pass
