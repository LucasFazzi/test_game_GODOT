extends Area2D

func _ready():
	pass

func _on_exit_lvl1_body_entered(body):
	if body.is_in_group("player"):
		get_tree().call_deferred("change_scene","res://Scenes/lvl2.tscn")
		call_deferred("queue_free")
	else:
		pass