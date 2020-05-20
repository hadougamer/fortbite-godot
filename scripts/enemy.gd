extends KinematicBody2D
 
var speed_x = 0
var speed_y = 0
var velocity = Vector2()

const DECELERATION = 2000
 
const JUMP_FORCE=800
const GRAVITY=2000

func _ready():
	set_process_input(true)

func _process(delta):
	speed_y += GRAVITY * delta

	velocity.y = speed_y 
	
	move_and_slide( velocity )
