extends Node2D

export var num_enemy=20

# Loads scene from library
var pre_bullet=preload("res://scene/bullet.tscn")
var pre_enemy=preload("res://scene/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# ENEMY
	
	if get_tree().get_nodes_in_group("enemies").size() < num_enemy:
		var enemy = pre_enemy.instance()
		var rnd = randi()%6
		enemy.scale.x=3
		enemy.scale.y=3
		enemy.global_position = $PosEnemy.get_child(rnd).global_position
		add_child(enemy)
	
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
		if $player.curdir == "right":
			print("shoot right")
			bullet.direction_x( $player.curdir )
			bullet.global_position=$"player/bulletPositionRight".global_position
		else:
			print("shoot left")
			bullet.direction_x( $player.curdir )
			bullet.global_position=$"player/bulletPositionLeft".global_position
		
		# Add the bullet
		print(bullet)
		add_child(bullet)	
