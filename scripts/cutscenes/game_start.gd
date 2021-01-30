extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.episode =="start":
		get_node("mansion_placeholder_1").position=Vector2(527,307)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if Global.episode =="":
		get_node("CanvasLayer/NinePatchRect").show_text("intro", "prestart",0)
		Global.episode="start"
	elif Global.episode =="start":
		get_node("CanvasLayer/NinePatchRect").show_text("intro", "start", 0)
		Global.episode="wake_up"

func _on_NinePatchRect_finished_dialog():
	if Global.episode=="start":
		SceneTransition.change_scene("res://scenes/cutscenes/game_start.tscn")
	elif Global.episode =="wake_up":
		Global.speak="start_wakeup"
		SceneTransition.change_scene("res://scenes/second_floor/ben_room.tscn")
	pass # Replace with function body.
