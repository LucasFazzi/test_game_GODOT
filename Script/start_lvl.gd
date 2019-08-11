extends Node2D

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().call_deferred("change_scene","res://Scenes/lvl1.tscn")
		call_deferred("queue_free")
