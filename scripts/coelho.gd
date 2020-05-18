extends KinematicBody2D

var input_direction = 0
var direction = 0
 
var speed_x = 0
var speed_y = 0
var velocity = Vector2()

var curdir="left"
 
const MAX_SPEED = 600
const ACCELERATION = 1000
const DECELERATION = 2000
 
const JUMP_FORCE=800
const GRAVITY=2000

func _ready():
	set_process(true)
	set_process_input(true)
 
 
func _input(event):
	if event.is_action_pressed("ui_jump"):
		speed_y = - JUMP_FORCE
 
 
func _process(delta):
	# INPUT
	if input_direction:
		direction = input_direction
	
	if Input.is_action_pressed("ui_left"):
		curdir="left"
		$sprites.play("walk-left")
		input_direction = -1
	elif Input.is_action_pressed("ui_right"):
		curdir="right"
		$sprites.play("walk-right")
		input_direction = 1
	else:
		$sprites.stop()
		input_direction = 0
   
	# MOVEMENT
	if input_direction == - direction:
		speed_x /= 3
	if input_direction:
		speed_x += ACCELERATION * delta
	else:
		speed_x -= DECELERATION * delta
	speed_x = clamp(speed_x, 0, MAX_SPEED)

	speed_y += GRAVITY * delta
   
	velocity.x = speed_x  * direction
	velocity.y = speed_y 
	
	move_and_slide( velocity )
