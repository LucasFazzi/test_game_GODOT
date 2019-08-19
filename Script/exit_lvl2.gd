extends Area2D

func _on_exit_body_entered(body):
	if body.is_in_group("player"):
		get_tree().call_deferred("change_scene","res://Scenes/lvl3.tscn")
		call_deferred("queue_free")
	else:
		pass