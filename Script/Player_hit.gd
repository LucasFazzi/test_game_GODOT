extends Area2D

signal hit
signal exit

func _ready():
	pass

func _on_player_hit_body_entered(body):
	emit_signal("hit")

func _on_player_hit_area_entered(area):
	if area.is_in_group("exit"):
		emit_signal("exit")
