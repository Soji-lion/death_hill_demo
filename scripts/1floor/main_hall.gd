extends Node


# Declare member variables here. Examples:
# var a = 2
var b = "text"
var next_to_the_secret = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room == "tea_room":
		get_node("character").position = Vector2(124.431,92.735)
	elif Global.room =="kitchen":
		get_node("character").position = Vector2(-74.42,-148.351)
	elif Global.room =="g_cabinet":
		get_node("character").position = Vector2(113.452,-148.903)
	elif Global.room =="lunch_room":
		get_node("character").position = Vector2(-143.99,28.43)
	elif Global.room =="clothes":
		get_node("character").position = Vector2(-77.113, 154.192)
	elif Global.room == "Entrance":
		get_node("character").position = Vector2(-2.833, 267.948)
	elif Global.room=="hall2f":
		get_node("character").position = Vector2(18.397, -174.201)
	elif Global.room=="library":
		get_node("character").position = Vector2(180.995, 23.963)
	elif Global.room=="toilet_1f":
		get_node("character").position = Vector2(181.249, -101.949)
	elif Global.room == "main_secret":
		get_node("character").position = Vector2(-10.613,-148.64)
	get_node("character").change_direction()
	Global.room = "main_hall"
	
	if Global.progress=="explore_2nd_floor":
		get_node("isaac_follow_me_speak").position= Vector2(20.766,-115.473)
		get_node("isaac_foolow_me").position= Vector2(0,0)
		


func _process(delta):
	if Input.is_action_just_pressed("action")&&next_to_the_secret==true:
		SceneTransition.change_scene("res://scenes/main_secret.tscn")
	
	

func _on_exit_body_entered(body):
	if ("1name1" in b):
		b.replace("1name1",Global.char_name)
	if body==get_node("character"):
		SceneTransition.change_scene("res://scenes/Main_menu.tscn")



func _on_2nd_floor_body_entered(body):
	if body==get_node("character"):
		SceneTransition.change_scene("res://scenes/second_floor/hall_2f.tscn")



func _on_kitchen_door_body_entered(body):
	if body==get_node("character"):
		SceneTransition.change_scene("res://scenes/kitchen.tscn")



func _on_tea_room_door_body_entered(body):
	if body==get_node("character"):
		SceneTransition.change_scene("res://scenes/tea_room.tscn")



func _on_lunch_room_door_body_entered(body):
	if body==get_node("character"):
		SceneTransition.change_scene("res://scenes/lunch_room.tscn")



func _on_clothes_door_body_entered(body):
	if body==get_node("character"):
		SceneTransition.change_scene("res://scenes/clothes.tscn")



func _on_workRoom_door_body_entered(body):
	if body==get_node("character"):
		SceneTransition.change_scene("res://scenes/g_cabinet.tscn")



func _on_library_body_entered(body):
	if body==get_node("character"):
		SceneTransition.change_scene("res://scenes/library.tscn")



func _on_toilet_body_entered(body):
	if Global.progress=="explore_2nd_floor":
		get_node("character/CanvasLayer/NinePatchRect").show_text("1", "toilet_not_enter", 0)
	else:
		if body==get_node("character"):
			SceneTransition.change_scene("res://scenes/toilet_1f.tscn")


func _on_main_secret_body_entered(body):
	if body==get_node("character"):
		next_to_the_secret = true
	


func _on_main_secret_body_exited(body):
	if body==get_node("character"):
		next_to_the_secret = false


func _on_Area2D_body_entered(body):
	get_node("character/CanvasLayer/NinePatchRect").show_text("intro", "isaac_follow_me_no", 0)
	pass # Replace with function body.
