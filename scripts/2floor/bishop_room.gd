extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room=="hall2f":
		get_node("player").position=Vector2(179.665,305.36)
	Global.room="bishop_room"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_hall_body_entered(body):
	SceneTransition.change_scene("res://scenes/second_floor/hall_2f.tscn")
	pass # Replace with function body.
