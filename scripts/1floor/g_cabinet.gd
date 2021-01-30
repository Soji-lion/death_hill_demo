extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room == "main_hall":
		get_node("player").position = Vector2(-63.575,66.231)
	elif Global.room =="cabinet":
		get_node("player").position = Vector2(79.229,-53.213)
	Global.room = "g_cabinet"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_cabinet_body_entered(body):
	SceneTransition.change_scene("res://scenes/cabinet.tscn")


func _on_main_hall_body_entered(body):
	SceneTransition.change_scene("res://scenes/Main_hall.tscn")
