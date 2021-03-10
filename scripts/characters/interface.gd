extends Control

func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("menu")&&Global.is_in_dialogue==false:
		get_tree().paused=!get_tree().paused
		visible=!visible
