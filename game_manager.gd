extends Node

@export var score_text : Label
@export var menu : Control
@export var menu_score : Label
@export var menu_high_score : Label

var score : int = 0
var high_score : int = 0
var is_player_dead : bool = false


func _ready():
	menu.hide()
	load_score()


func score_up():
	if is_player_dead:
		return 
	score += 1
	score_text.text = str( score )


func _on_bird_died():
	is_player_dead = true
	menu.show()
	menu_score.text = str( score )
	if score > high_score:
		high_score = score
		save_score()
	menu_high_score.text = str( high_score )


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	#get_tree().change_scene_to_file("res://Test_level.tscn")


func load_score():
	if not FileAccess.file_exists( "user://game_save.json" ):
		return
	var file = FileAccess.open( "user://game_save.json", FileAccess.READ )
	var data = JSON.parse_string( file.get_line() )
	high_score = data["high_score"]
	file.close()


func save_score():
	var file = FileAccess.open( "user://game_save.json", FileAccess.WRITE )
	var data = JSON.stringify( { "high_score":high_score, } )
	file.store_line( data )
	file.close()
