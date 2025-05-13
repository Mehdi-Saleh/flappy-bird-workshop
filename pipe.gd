extends AnimatableBody2D

@export var speed = 500.0

func _process(delta):
	position.x -= speed * delta
