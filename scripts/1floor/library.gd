extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room == "main_hall":
		get_node("player").position = Vector2(-89.343,21.381)
	get_node("player").change_direction()
	Global.room = "library"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_exit_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/Main_hall.tscn")
