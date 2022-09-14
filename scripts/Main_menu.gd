	extends Control


func _ready():
	BgMusic.pause_bg()
	if Global.endings[0]==true:
		get_node("despair_end").visible_characters=-1
	else:
		get_node("despair_end").visible_characters=0
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_new_game_pressed():
	Global.in_game = true
	Global.speak="start_wakeup"
	Global.room=""
	SceneTransition.change_scene("res://scenes/second_floor/ben_room.tscn")
#			TODO: there should be a proper scene transition at some point
#	/cutscenes/game_start.tscn")
	pass


func _on_settings_pressed():
	SceneTransition.change_scene("res://scenes/Settings_MM.tscn")
	pass # Replace with function body.

var game_stats = "user://save1.dat"
var game_settings = "user://save2.dat"
func _on_continue_pressed():
	SaveLoad.load_game(game_stats, game_settings)
	pass
