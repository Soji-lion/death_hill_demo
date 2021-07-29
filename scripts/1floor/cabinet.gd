extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room == "g_cabinet":
		get_node("player").position=Vector2(610,409)
	elif Global.room == "main_secret":
		get_node("player").position=Vector2(384.79,319.699)
	get_node("player").change_direction()
	Global.room = "cabinet"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/g_cabinet.tscn")
	pass # Replace with function body.


func _on_hall_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/main_secret.tscn")
	pass # Replace with function body.
