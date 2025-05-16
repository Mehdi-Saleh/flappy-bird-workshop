extends Node2D

const PIPE_UP = preload("res://pipe.tscn")
const PIPE_DOWN = preload("res://pipe_down.tscn")

var is_player_dead = false

@export var pipes_distance = 600
@export var pipe_min_y = -20
@export var pipe_max_y = 60

func create_pipes():
	if is_player_dead:
		return
	
	var pipe_y = randi_range(pipe_min_y, pipe_max_y)
	 
	var new_pipe_up = PIPE_UP.instantiate()
	new_pipe_up.position = Vector2( 1250, pipes_distance   + pipe_y )
	add_child( new_pipe_up )
	
	var new_pipe_down = PIPE_DOWN.instantiate()
	new_pipe_down.position = Vector2( 1250, 0 + pipe_y )
	add_child( new_pipe_down )



func _on_bird_died():
	is_player_dead = true
