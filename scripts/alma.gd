extends KinematicBody2D

var velocity = Vector2()
var move_speed = 480
var gravity = 2000
var jump_force = -720
var is_grounded 
onready var raycasts = $raycasts
var mode = "luz"

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("move_up"):
		velocity.y = jump_force 
	
	_get_input()
	
	move_and_slide(velocity)
	
	if Input.is_action_just_pressed("changeMode"):
		_set_animation()

func _get_input():
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)

	if move_direction != 0:
		$Sprite.scale.x = move_direction * 0.15

func _input(event):
	if event.is_action_pressed("move_up") && _check_is_grounded():
		velocity.y = jump_force
		
func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
			
	return false	
		
#func _change_mode():
#	if Input.is_action_pressed("changeMode"):

func _set_animation():
	if $animation.assigned_animation == "luz":
		mode = "sombra"
	else:
		mode = "luz"
	
	$animation.play(mode)
