extends KinematicBody2D

var MOVE_SPEED_DOWN_MAX = 100
var MOVE_SPEED_UP_MAX = - 100

var down = false
var up = true

var VELOCITY = Vector2()

func _ready():
	$".".add_to_group("enemies")

func _physics_process(delta):

	if $raycast_up.is_colliding():
		down = true
		up = false

	if $raycast_down.is_colliding():
		down = false
		up = true

	if up == true:
		VELOCITY.y = MOVE_SPEED_UP_MAX
		$AnimatedSprite.play("idle")
		VELOCITY = move_and_slide(VELOCITY).normalized()

	if down == true:
		VELOCITY.y = MOVE_SPEED_DOWN_MAX
		$AnimatedSprite.play("idle")
		VELOCITY = move_and_slide(VELOCITY).normalized()