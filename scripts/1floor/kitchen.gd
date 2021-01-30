extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room == "main_hall":
		get_node("player").position = Vector2(612.694,415.491)
	elif Global.room =="pantry":
		get_node("player").position = Vector2(451.118,343.64)
	Global.room = "kitchen"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	SceneTransition.change_scene("res://scenes/pantry.tscn")
	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	SceneTransition.change_scene("res://scenes/Main_hall.tscn")
	pass # Replace with function body.
