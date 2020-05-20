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
func _physics_process(delta):
	var info = move_and_collide( Vector2( dir_x, 0) * speed * delta )
	if info && info.collider.is_in_group("enemies"):
		# Collides with a enemy
		info.collider.queue_free()
		get_parent().num_enemy = get_parent().num_enemy + 1
	elif info && !info.collider.is_in_group("enemies"):
		# Collides with other thing
		self.queue_free()

func _on_notifier_screen_exited():
	# Destroy this bullet
	queue_free()
