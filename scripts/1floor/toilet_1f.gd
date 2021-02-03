extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var SPEAK = get_node("player/CanvasLayer/NinePatchRect")
onready var scare =get_node("scary/AudioStreamPlayer2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room == "main_hall":
		get_node("player").position = Vector2(-61.103,15.984)
	Global.room = "toilet_1f"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.speak=="toilet"&&Input.is_action_just_pressed("action")&&not SPEAK.on_dialog:
		get_node("player").speed=0
		SPEAK.show_text("intro","richard_storm", 0)
		#SPEAK.show_text("1","toilet",0)
	if Global.selected_option == 1:
		SPEAK.show_text("intro", "isaac_follow_me", 0)
		Global.selected_option = -1
	elif Global.selected_option == 2:
		pass
	elif Global.selected_option ==3:
		pass
	pass


func _on_Area2D_body_entered(body):
	SceneTransition.change_scene("res://scenes/Main_hall.tscn")



func _on_scary_body_entered(body):
	scare.play()
	pass # Replace with function body.
