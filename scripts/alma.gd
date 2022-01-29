extends KinematicBody2D

var velocity = Vector2()
var move_speed = 480
var gravity = 2000
var jump_force = -720

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("move_up"):
		velocity.y = jump_force 
	
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	velocity.x = move_speed * move_direction
	
	move_and_slide(velocity)
	
	if move_direction != 0:
		$Sprite.scale.x = move_direction * 0.15
