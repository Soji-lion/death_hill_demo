extends Control

func _ready():
	if Global.progress=="awake"||Global.progress=="met_emily":
		get_node("TabContainer").set_tab_disabled(2, true)
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("menu")&&Global.is_in_dialogue==false:
		pause()

func pause():
	get_tree().paused=!get_tree().paused
	visible=!visible
	Global.in_game=!Global.in_game
