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
		#get_node("John_cutscene/Camera2D").current=true
		get_node("player").position=Vector2(256,115)
		#get_node("John_cutscene").position=Vector2(256,115)
		get_node("John_cutscene").animation="idle_right"
		get_node("richard").animation="idle_left"
		get_node("richard").position=Vector2(388,138)
		SPEAK.show_text("main","richard_wake",0)
		#get_node("player/Control").show()
		Global.char_direction="idle_right"
	elif Global.speak=="start_wakeup_repeat":
		get_node("player").speed=0
		#get_node("John_cutscene/Camera2D").current=true
		get_node("player").position=Vector2(256,115)
		#get_node("John_cutscene").position=Vector2(256,115)
		get_node("John_cutscene").animation="idle_right"
		get_node("richard").animation="idle_left"
		get_node("richard").position=Vector2(388,138)
		SPEAK.show_text("main","richard_wake_repeat", 0)
	get_node("player").change_direction()
	Global.room="ben_room"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if Global.speak=="bed"&&Input.is_action_just_pressed("action")&&not SPEAK.on_dialog:
#		get_node("player").speed=0
#		SPEAK.show_text("1","bed",0)
	if SPEAK.finished_dialog&&Global.speak== "start_wakeup":
		#get_node("player").speed=0
		Global.can_move=false
		get_node("player/Node2D2/Control").show()
		if (get_node("player/Node2D2/Control/ColorRect/Button").is_pressed()):
#		if(Global.char_name!=""&&Global.char_name!="???"): 						need a way to implement this later
			Global.speak="name_selected"
			get_node("player/Node2D2").hide()
			get_node("player").speed=80
			SPEAK.show_text("main", "name_selected",0)
	elif SPEAK.finished_dialog&&Global.speak=="name_selected":
		SceneTransition.fade_in()
		get_node("richard").position=Vector2(0,0)
		SceneTransition.fade_out()
		Global.speak="richard_disappear"
		SPEAK.show_text("main", "richard_disappear", 0)
	elif SPEAK.finished_dialog&&Global.speak=="richard_disappear":
		Global.speak=""
		Global.progress="find_out_more"
		BgMusic.play_bg()
	elif SPEAK.finished_dialog&&Global.speak=="start_wakeup_repeat":
		Global.speak=""
		SceneTransition.fade_in()
		get_node("richard").position=Vector2(0,0)
		SceneTransition.fade_out()
		#SceneTransition.fade_in()
		#get_node("AnimationPlayer").play("exit_room")
		#SceneTransition.fade_out()
		#Global.speak=""
		pass
		#get_node("player/Camera2D").current=true
		#get_node("John_cutscene").position=Vector2(0,0)
		#get_node("player").position=Vector2(284,125)
		

func _on_hall_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/second_floor/hall_2f.tscn")
	pass # Replace with function body.



func _on_bed_speak_body_entered(body):
	
#	Global.speak="bed"
	pass



func _on_bed_speak_body_exited(body):
#	Global.speak=""
	pass



func _on_AnimationPlayer_animation_finished(exit_room):
	Global.progress = "awake"
	Global.room ="third_floor"
	SceneTransition.change_scene("res://scenes/second_floor/hall_2f.tscn")
	pass # Replace with function body.
