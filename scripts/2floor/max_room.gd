extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room=="hall2f":
		get_node("player").position=Vector2(111.099, 122.589)
	elif Global.room=="game_room":
		get_node("player").position=Vector2(266.246,69.149)
	get_node("player").change_direction()
	Global.room="max_room"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_hall_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/second_floor/hall_2f.tscn")
	pass # Replace with function body.


func _on_game_room_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/second_floor/game_room.tscn")
	pass # Replace with function body.
