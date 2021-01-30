extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var eod =false
onready var SPEAK = get_node("player/CanvasLayer/NinePatchRect")

# Called when the node enters the scene tree for the first time.

func _ready():
	if Global.room=="hall2f":
		get_node("player").position=Vector2(427.821,158.556)
	elif Global.speak=="start_wakeup":
		get_node("player").speed=0
		get_node("John_cutscene/Camera2D").current=true
		get_node("player").position=Vector2(0,0)
		get_node("John_cutscene").position=Vector2(256,115)
		SPEAK.show_text("intro","start_wakeup",0)
		
	Global.room="ben_room"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.speak=="bed"&&Input.is_action_just_pressed("action")&&not SPEAK.on_dialog:
		get_node("player").speed=0
		SPEAK.show_text("1","bed",0)
	if SPEAK.finished_dialog&&Global.speak== "start_wakeup":
		
		SceneTransition.fade_in()
		get_node("AnimationPlayer").play("exit_room")
		SceneTransition.fade_out()
		Global.speak=""
		
		#get_node("player/Camera2D").current=true
		#get_node("John_cutscene").position=Vector2(0,0)
		#get_node("player").position=Vector2(284,125)
		

func _on_hall_body_entered(body):
	SceneTransition.change_scene("res://scenes/second_floor/hall_2f.tscn")
	pass # Replace with function body.



func _on_bed_speak_body_entered(body):
	
	Global.speak="bed"
	pass



func _on_bed_speak_body_exited(body):
	Global.speak=""
	pass



func _on_AnimationPlayer_animation_finished(exit_room):
	Global.progress = "awake"
	Global.room ="third_floor"
	SceneTransition.change_scene("res://scenes/second_floor/hall_2f.tscn")
	pass # Replace with function body.
