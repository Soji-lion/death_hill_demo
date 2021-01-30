extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room == "lunch_room":
		get_node("player").position = Vector2(78.634,149.571)
	elif Global.room =="kitchen":
		get_node("player").position = Vector2(79.367,45.525)
	Global.room="pantry"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_kitchen_body_entered(body):
	SceneTransition.change_scene("res://scenes/kitchen.tscn")
	pass # Replace with function body.

func _on_dining_body_entered(body):
	SceneTransition.change_scene("res://scenes/lunch_room.tscn")
