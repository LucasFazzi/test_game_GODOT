extends Area2D

signal hit

func _ready():
	pass

func _on_player_hit_body_entered(body):
	emit_signal("hit")
