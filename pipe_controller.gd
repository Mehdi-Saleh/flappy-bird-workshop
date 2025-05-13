extends Node2D

const PIPE_UP = preload("res://pipe.tscn")
const PIPE_DOWN = preload("res://pipe_down.tscn")

@export var pipe_min_y = -20
@export var pipe_max_y = 60

func create_pipes():
	var pipe_y = randi_range(pipe_min_y, pipe_max_y)
	 
	var new_pipe_up = PIPE_UP.instantiate()
	new_pipe_up.position = Vector2( 1250, 500 + pipe_y )
	add_child( new_pipe_up )
	
	var new_pipe_down = PIPE_DOWN.instantiate()
	new_pipe_down.position = Vector2( 1250, 0 + pipe_y )
	add_child( new_pipe_down )
