extends RigidBody2D

var is_dead = false

@export var jump_force = 2500.0
# ctrl + drag
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var jump_audio = $JumpAudio
@onready var death_audio = $DeathAudio


signal died

func _ready():
	#animated_sprite_2d.play("Playing")
	pass
			 
func _process(delta):
	if Input.is_action_just_pressed("Jump"):
		jump()            
	
func jump():
	if is_dead:
		return
	linear_velocity.y = -jump_force
	jump_audio.play()


func _on_body_entered(body):
	die()

func die():
	if is_dead:
		return
	is_dead = true
	death_audio.play( )
	died.emit()
