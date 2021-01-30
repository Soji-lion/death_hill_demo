extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room=="main_hall":
		get_node("player").position=Vector2(550.418, 268.871)
	elif Global.room=="toilet_2f":
		get_node("player").position = Vector2(462.307,166.417)
	elif Global.room=="ben_room":
		get_node("player").position = Vector2(415.378,272.76)
	elif Global.room=="bishop_room":
		get_node("player").position = Vector2(683.974,637.22)
	elif Global.room=="game_room":
		get_node("player").position = Vector2(623.301,95.205)
	elif Global.room=="jenny_room":
		get_node("player").position = Vector2(414.97,637.653)
	elif Global.room=="max_room":
		get_node("player").position = Vector2(684.091,261.577)
	elif Global.room=="third_floor":
		get_node("player").position = Vector2(543,575)
	#if Global.progress = "awake":
		
	Global.room="hall2f"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_node("player/Control/ColorRect/Button").is_pressed()):
		print (Global.char_name)
		get_node("player/Control").hide()
#	pass


func _on_1f_body_entered(body):
	SceneTransition.change_scene("res://scenes/Main_hall.tscn")


func _on_toilet_2f_body_entered(body):
	SceneTransition.change_scene("res://scenes/second_floor/toilet_2f.tscn")
	pass # Replace with function body.


func _on_Jenny_room_body_entered(body):
	SceneTransition.change_scene("res://scenes/second_floor/jenny_room.tscn")
	pass # Replace with function body.


func _on_ben_room_body_entered(body):
	SceneTransition.change_scene("res://scenes/second_floor/ben_room.tscn")
	pass # Replace with function body.


func _on_bishop_room_body_entered(body):
	SceneTransition.change_scene("res://scenes/second_floor/bishop_room.tscn")
	pass # Replace with function body.


func _on_max_room_body_entered(body):
	SceneTransition.change_scene("res://scenes/second_floor/max_room.tscn")
	pass # Replace with function body.


func _on_game_room_body_entered(body):
	SceneTransition.change_scene("res://scenes/second_floor/game_room.tscn")
	pass # Replace with function body.


func _on_third_floor_body_entered(body):
	get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "back_to_the_bedroom", 0)
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	get_node("player/Control").show()
	
	pass # Replace with function body.
