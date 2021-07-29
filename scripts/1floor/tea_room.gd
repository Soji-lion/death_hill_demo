extends Node





func _ready():
	if Global.room =="main_hall":
		get_node("player").position=Vector2(466,274)
	get_node("player").change_direction()
	Global.room = "tea_room"
	pass 


#onready var pl = get_tree().get_node("res://scenes/Main_menu.tscn")

func _on_Area2D_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/Main_hall.tscn")
