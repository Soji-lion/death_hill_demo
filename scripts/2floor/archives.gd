extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room=="family_dining":
		get_node("player").position=Vector2(172.938,194.037)
	Global.room="archives"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_down_body_entered(body):
	SceneTransition.change_scene("res://scenes/family_dining.tscn")
	pass # Replace with function body.


func _on_up_body_entered(body):
	SceneTransition.change_scene("res://scenes/Settings_MM.tscn")
	pass # Replace with function body.
