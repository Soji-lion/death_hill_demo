extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var next_to_the_secret = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room == "main_hall":
		get_node("player").position = Vector2(621.186, 293.073)
	elif Global.room == "pantry":
		get_node("player").position = Vector2(539.754, 165.766)
	elif Global.room =="basement_entrance":
		get_node("player").position = Vector2(604.008,425.349)
	get_node("player").change_direction()
	Global.room = "lunch_room"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("action")&&next_to_the_secret==true:
		SceneTransition.change_scene("res://scenes/basement_entrance.tscn")


func _on_Area2D_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/Main_hall.tscn")
	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/pantry.tscn")
	pass # Replace with function body.


func _on_secret_body_entered(body):
	if body==get_node("player"):
		next_to_the_secret = true
	pass # Replace with function body.


func _on_secret_body_exited(body):
	if body==get_node("player"):
		next_to_the_secret = false
	pass # Replace with function body.
