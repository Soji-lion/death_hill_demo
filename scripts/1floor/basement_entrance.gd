extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room =="lunch_room":
		get_node("player").position = Vector2(79.756,100.071)
	Global.room = "basement_entrance"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	SceneTransition.change_scene("res://scenes/lunch_room.tscn")
	pass # Replace with function body.
