extends RigidBody2D

@export var jump_force = 2500.0

func _ready():
	pass
			 
func _process(delta):
	if Input.is_action_just_pressed("Left"):
		apply_central_impulse( Vector2( -100.0, 0 ) )
	if Input.is_action_just_pressed("Right"):
		apply_central_impulse( Vector2( 100.0, 0 ) )
	if Input.is_action_just_pressed("Jump"):
		linear_velocity.y = -jump_force         
	
