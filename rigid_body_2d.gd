extends RigidBody2D

@export var jump_force = 2500.0
# ctrl + drag
@onready var animated_sprite_2d = $AnimatedSprite2D
#@export var animated_sprite : AnimatedSprite2D


func _ready():
	#animated_sprite_2d.play("Playing")
	pass
			 
func _process(delta):
	if Input.is_action_just_pressed("Left"):
		animated_sprite_2d.play("Flying")
	if Input.is_action_just_pressed("Right"):
		animated_sprite_2d.play("Walking")
	if Input.is_action_just_pressed("Jump"):
		jump()            
	
func jump():
	linear_velocity.y = -jump_force   
