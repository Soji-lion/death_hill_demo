	extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_new_game_pressed():
	Global.in_game = true
	Global.speak="start_wakeup";
	SceneTransition.change_scene("res://scenes/second_floor/ben_room.tscn")
#			TODO: there should be a proper scene transition at some point
#	/cutscenes/game_start.tscn")
	pass # Replace with function body.


func _on_settings_pressed():
	SceneTransition.change_scene("res://scenes/Settings_MM.tscn")
	pass # Replace with function body.

var save_path = "user://save1.dat"
func _on_continue_pressed():
	SaveLoad.load_game(save_path)
	pass # Replace with function body.
