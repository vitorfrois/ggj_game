extends KinematicBody2D

var velocity = Vector2()
var move_speed = 160
var gravity = 1500
var jump_force = -500
var is_grounded 
onready var raycasts = $raycasts
var mode = "luz"
var modebool = true

func _ready():
	var nodes_luz = get_node("../WallLuz/").get_children()
	for node in nodes_luz:
		node.visible = modebool
		node.get_node("CollisionShape2D").disabled = !modebool
	
	var nodes_sombra = get_node("../WallSombra/").get_children()
	for node in nodes_sombra:
		node.visible = !modebool
		node.get_node("CollisionShape2D").disabled = modebool
	
	var nodes_luz_plat = get_node("../luz_platforms/").get_children()
	for node in nodes_luz_plat:
		node.visible = modebool
		node.get_node("CollisionShape2D").disabled = !modebool

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("move_up") && _check_is_grounded():
		velocity.y = jump_force 
	
	if _check_is_grounded():
		gravity = 0
	else:
		gravity = 1500
	
	_get_input()
	
	move_and_slide(velocity)
	
	_set_animation()
		
	
#	if Input.is_action_pressed("debug"):
#		get_node(sombra_platforms/Area2D/CollisionShape2D).disabled = true
		

func _get_input():
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
	
	
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_up"):
		$"movement sound".play()


	if move_direction != 0:
		$Sprite.scale.x = move_direction * 0.15
		
	
	if Input.is_action_just_pressed("changeMode"):
		modebool = !modebool
		var nodes_luz = get_node("../WallLuz/").get_children()
		for node in nodes_luz:
			node.visible = modebool
			node.get_node("CollisionShape2D").disabled = !modebool
		
		var nodes_sombra = get_node("../WallSombra/").get_children()
		for node in nodes_sombra:
			node.visible = !modebool
			node.get_node("CollisionShape2D").disabled = modebool
			
		var nodes_luz_plat = get_node("../luz_platforms/").get_children()
		for node in nodes_luz_plat:
			node.visible = modebool
			node.get_node("CollisionShape2D").disabled = !modebool

func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
			
	return false	

func _set_animation():
	if Input.is_action_just_pressed("changeMode"):
		if $animation.assigned_animation == "luz":
			mode = "sombra"
		elif $animation.assigned_animation == "sombra":
			mode = "luz"
		elif $animation.assigned_animation == "sombra_walking":
			mode = "luz_walking"
		elif $animation.assigned_animation == "luz_walking":
			mode = "sombra_walking"	

	_switch_type()	
	$animation.play(mode)
	
			
func _switch_type():
	if velocity.x >= 10 || velocity.x <= -10:
		if $animation.assigned_animation == "luz":
			mode = "luz_walking"
		elif $animation.assigned_animation == "sombra":
			mode = "sombra_walking"
	else:
		if $animation.assigned_animation == "luz_walking":
			mode = "luz"
		elif $animation.assigned_animation == "sombra_walking":
			mode = "sombra"
				
	
