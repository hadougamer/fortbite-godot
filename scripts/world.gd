extends Node2D

# Loads scene from library
var pre_bullet=preload("res://scene/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# SHOOT
	if Input.is_action_just_pressed("ui_shoot"):
		if get_tree().get_nodes_in_group("bullets").size() > 20:
			return
		
		
		print(get_tree().get_nodes_in_group("bullets").size())
		
		# Instances bullet
		var bullet = pre_bullet.instance()
		bullet.scale.x=3
		bullet.scale.y=3
		
		# Put bullet on position
		if $coelho.curdir == "right":
			print("shoot right")
			bullet.direction_x( $coelho.curdir )
			bullet.global_position=$"coelho/bulletPositionRight".global_position
		else:
			print("shoot left")
			bullet.direction_x( $coelho.curdir )
			bullet.global_position=$"coelho/bulletPositionLeft".global_position
		
		# Add the bullet
		print(bullet)
		add_child(bullet)	
