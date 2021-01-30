extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room =="main_secret":
		get_node("player").position = Vector2(240,82)
	elif Global.room =="archives":
		get_node("player").position = Vector2(49.858, 82.897)
	Global.room = "family_dining"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#if $player.anim=="walk_left":

func _on_2nd_floor_body_entered(body):
	SceneTransition.change_scene("res://scenes/second_floor/archives.tscn")
	pass # Replace with function body.


func _on_secret_hall_body_entered(body):
	SceneTransition.change_scene("res://scenes/main_secret.tscn")
