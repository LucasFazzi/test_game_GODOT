extends KinematicBody2D
 
signal anima_left
signal anima_right
signal anima_idle

const MOVE_SPEED = 200
const JUMP_FORCE = 1000
const GRAVITY = 52
const MAX_FALL_SPEED = 1000
var y_velo = 0
 
func _ready():
	$".".add_to_group("player")

func _physics_process(delta):

	var move_dir = 0

	if Input.is_action_pressed("ui_right"):
		move_dir += 1

	if Input.is_action_pressed("ui_left"):
		move_dir -= 1

	if Input.is_action_pressed("restart"):
		get_parent().get_tree().call_deferred("reload_current_scene")
	
	if move_dir > 0:
		emit_signal("anima_right")
	if move_dir < 0:
		emit_signal("anima_left")

	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1))

	var grounded = is_on_floor()

	y_velo += GRAVITY
	if grounded and Input.is_action_just_pressed("jump"):
		y_velo = -JUMP_FORCE
	if grounded and y_velo >= 5:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED

	if is_on_ceiling():
		y_velo = GRAVITY

	if grounded:
		if move_dir == 0:
			emit_signal("anima_idle")

func _on_player_hit_hit():
	get_parent().get_tree().call_deferred("reload_current_scene")
