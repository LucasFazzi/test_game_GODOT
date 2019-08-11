extends KinematicBody2D

var MOVE_SPEED_RIGHT_MAX = 100
var MOVE_SPEED_LEFT_MAX = - 100

var left = false
var right = true

var VELOCITY = Vector2()

func _ready():
	$".".add_to_group("enemies")

func _physics_process(delta):

	if $RayCast_right.is_colliding():
		left = true
		right = false

	if $RayCast2D_left.is_colliding():
		left = false
		right = true

	if left == true:
		VELOCITY.x = MOVE_SPEED_LEFT_MAX
		VELOCITY = move_and_slide(VELOCITY).normalized()

	if right == true:
		VELOCITY.x = MOVE_SPEED_RIGHT_MAX
		VELOCITY = move_and_slide(VELOCITY).normalized()