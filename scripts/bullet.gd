extends KinematicBody2D

var dir_x=1
var speed=250

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func direction_x( value  ):
	if value == "right":
		dir_x=1
	else:
		dir_x=-1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate( Vector2( dir_x, 0) *  speed * delta )
	


func _on_notifier_screen_exited():
	# Destroy this bullet
	queue_free()
