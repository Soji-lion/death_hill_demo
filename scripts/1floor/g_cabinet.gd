extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cupboard2=false
var cupboard=false
var bookshelf=false
var bookshelf2=false
var bookshelf3=false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.room == "main_hall":
		get_node("player").position = Vector2(-63.575,66.231)
	elif Global.room =="cabinet":
		get_node("player").position = Vector2(79.229,-53.213)
	elif Global.room=="g_cabinet":
			get_node("player").position=Vector2(Global.char_position)
	get_node("player").change_direction()
	Global.room = "g_cabinet"
	
	if Global.progress=="explore_2nd_floor":
		get_node("trigger").position=Vector2(-63,76)
		get_node("richard").position=Vector2(-18, -13)
		get_node("trigger").position=Vector2(-63, 76)
		Global.progress="richard_meet"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("player/CanvasLayer/NinePatchRect").finished_dialog:
		if Global.speak=="intro, richard_meet":
			Global.speak=""
			Global.can_move=false
			get_node("")
			get_node("thunder").play()
		if Global.speak=="intro, richard_storm":
			get_node("AnimationPlayer").play("richard_leave1")
			Global.can_move=false
		if Global.speak=="intro, richard_detective_secret1":
			Global.can_move=false
			get_node("AnimationPlayer").play("richard_turn")
		if Global.speak=="intro, richard_detective_secret2":
			Global.can_move=false
			get_node("AnimationPlayer").play("richard_turn_fast")
			
		


func _on_cabinet_body_entered(body):
	if Global.progress=="richard_meet":
		pass
	else:
		if body==get_node("player"):
			#SceneTransition.change_scene("res://scenes/cabinet.tscn")
			pass
#		elif body ==get_node("richard/KinematicBody2D"): just an example on how to reference other characters
#			pass


func _on_main_hall_body_entered(body):
	if Global.progress=="richard_meet":
		pass
	else:
		if body==get_node("player"):
			SceneTransition.change_scene("res://scenes/Main_hall.tscn")


func _on_trigger_body_entered(body):
	if Global.progress=="richard_meet":
		get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "richard_come_closer", 0)
	pass # Replace with function body.


func _on_front_body_entered(body):
	if Global.progress=="richard_meet":
		Global.speak="intro, richard_meet"
		get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "richard_meet", 0)
	pass # Replace with function body.


func _on_thunder_finished():
	Global.speak="intro, richard_storm"
	get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "richard_storm")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="richard_leave1":
		Global.speak="intro, richard_detective_secret1"
		get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "richard_detective_secret1")
	
	if anim_name=="richard_turn":
		Global.speak="intro, richard_detective_secret2"
		get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "richard_detective_secret2")
	
	if anim_name=="richard_turn_fast":
		Global.can_move=true
		Global.progress="find_rachel"
		Global.speak=""
		Global.char_position= get_node("player").position
		SceneTransition.change_scene("res://scenes/g_cabinet.tscn")
	


func _on_cupboard2_body_entered(body):
	if body==get_node("player"):
		cupboard2=true
	


func _on_bookshelf_body_entered(body):
	if body==get_node("player"):
		bookshelf=true
	


func _on_bookshelf2_body_entered(body):
	if body==get_node("player"):
		bookshelf2=true
	


func _on_bookshelf3_body_entered(body):
	if body==get_node("player"):
		bookshelf3=true
	

func _on_cupboard_body_entered(body):
	if body==get_node("player"):
		cupboard=true
	

func _on_cupboard2_body_exited(body):
	if body==get_node("player"):
		cupboard2=false


func _on_bookshelf_body_exited(body):
	if body==get_node("player"):
		bookshelf=false


func _on_bookshelf2_body_exited(body):
	if body==get_node("player"):
		bookshelf2=false


func _on_bookshelf3_body_exited(body):
	if body==get_node("player"):
		bookshelf3=false



func _on_cupboard_body_exited(body):
	if body==get_node("player"):
		cupboard=false

func _input(event):
	if Input.is_action_just_pressed("action"):
		if cupboard==true:
			get_node("player/CanvasLayer/NinePatchRect").show_text("1", "full_cupboard")
		
		elif cupboard2==true:
			get_node("player/CanvasLayer/NinePatchRect").show_text("1", "empty_cupboard")
		
		elif bookshelf==true:
			get_node("player/CanvasLayer/NinePatchRect").show_text("1", "full_bookshelf")
			
		elif bookshelf2==true:
			get_node("player/CanvasLayer/NinePatchRect").show_text("1", "full_bookshelf")
		
		elif bookshelf3==true:
			get_node("player/CanvasLayer/NinePatchRect").show_text("1", "full_bookshelf")
