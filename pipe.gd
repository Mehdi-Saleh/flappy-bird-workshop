extends AnimatableBody2D

@export var speed = 200.0

func _physics_process(delta):
	position.x -= speed * delta


func _on_timer_timeout():
	queue_free()
