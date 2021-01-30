extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room =="cabinet":
		get_node("player").position = Vector2(81.19,89.499)
	elif Global.room =="family_dining":
		get_node("player").position = Vector2(44.289,86.719)
	elif Global.room =="main_hall":
		get_node("player").position = Vector2(62.262,305.88)
	Global.room = "main_secret"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_cabinet_body_entered(body):
	SceneTransition.change_scene("res://scenes/cabinet.tscn")
	pass # Replace with function body.


func _on_family_dine_body_entered(body):
	SceneTransition.change_scene("res://scenes/family_dining.tscn")
	pass # Replace with function body.


func _on_main_hall_body_entered(body):
	SceneTransition.change_scene("res://scenes/Main_hall.tscn")
	pass # Replace with function body.
