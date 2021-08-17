extends Node

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
	get_node("player").change_direction()
	Global.room="hall2f"
	if Global.progress=="awake":
		start_emily_meeting()
	elif Global.progress=="find_rachel":
		get_node("rachel").position=Vector2(618,106)
	elif Global.progress=="met_rachel":
		get_node("rachel").position=Vector2(618,106)
		get_node("player").position=Vector2(Global.char_position)
		Global.speak="intro, rachel_check"
		get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "rachel_check")
	#elif Global.progress=="find_rachel_bag":
#		get_node("player").position=Vector2(Global.char_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_node("player/code/ColorRect/Button").is_pressed()):
		get_node("player/code").hide()
		if get_node("player/code").answer=="1604":
			print ("correct code")
			pass
	
	if (get_node("player/Control/ColorRect/Button").is_pressed()):
#		if(Global.char_name!=""&&Global.char_name!="???"): 						need a way to implement this later
		get_node("player/Control").hide()
		get_node("player").speed=80
		Global.progress="name_selected"
		Global.speak="intro, isaac_name_select"
		get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "isaac_name_select")
		
	if get_node("player/CanvasLayer/NinePatchRect").play_func:
		var func_name=""
		for i in 1:
			func_name = get_node("player/CanvasLayer/NinePatchRect").res
		get_node("player/CanvasLayer/NinePatchRect").play_func=false
		if func_name=="1func1_enter_ben_door_code":
			enter_ben_door_code()
			pass
		
	
	if get_node("player/CanvasLayer/NinePatchRect").finished_dialog:
		if Global.speak == "intro, emily_meet":
			get_node("invisible_event_walls/CollisionPolygon2D").position = Vector2(-1594.989,-393.23)
			get_node("invisible_event_walls/CollisionPolygon2D2").position = Vector2(-1578.925,-384.02)
			get_node("actions/meet_emily/CollisionShape2D").position = Vector2(1086.286,-16.819)
			get_node("AnimationPlayer").play("emily_meet_leave")
		elif Global.speak =="intro, isaac_meet":
			get_node("player/interface").visible=true
			get_node("player/interface/TabContainer").set_tab_disabled(2,false)
			get_node("player/interface/TabContainer").current_tab=2
			get_node("player").speed=0
			Global.speak="intro, isaac_notebook"
			Global.in_game=false
			Global.progress = "got_notebook"
			get_tree().paused=true
		elif Global.speak == "intro, isaac_notebook":
			if Global.progress=="name_select"&&Global.in_game==true:
				Global.can_move=false
				get_node("player/Control").show()
		elif Global.speak=="intro, isaac_name_select":
			get_node("AnimationPlayer").play("isaac_meet_leave")
			get_node("invisible_event_walls/CollisionPolygon2D").position=Vector2(-1590, -394)
			Global.speak=""
			Global.progress="explore_2nd_floor"
		elif Global.speak=="intro, rachel_meet":
			Global.progress="met_rachel"
			Global.speak=""
			Global.char_position=get_node("player").position
			SceneTransition.change_scene("res://scenes/second_floor/hall_2f.tscn")
		elif Global.speak=="intro, rachel_check":
			Global.speak=""
			Global.progress="find_rachel_bag"
			Global.char_position=get_node("player").position
			SceneTransition.change_scene("res://scenes/second_floor/hall_2f.tscn")
			pass
	
	
	if Global.progress=="met_emily":
		get_node("invisible_event_walls/CollisionPolygon2D").position = Vector2(11,-79.5)
		if Global.speak =="isaac_meet":
			get_node("player/CanvasLayer/NinePatchRect").show_text("intro","isaac_meet",0)
			Global.progress = ""
			Global.speak ="intro, isaac_meet"
	elif Global.progress=="explore_2nd_floor":
		if Global.temp_progress!=Global.progress:
			
			#nothing to put here yet!!!
			#(maybe shouldn't use this way as there are two other ways already been implemented!)
			
			Global.temp_progress=Global.progress
			
	elif Global.progress=="find_rachel":
		if Global.speak=="rachel_meet":
			Global.speak="intro, rachel_meet"
			get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "rachel_meet")
	
	if Global.progress=="got_notebook"&&Global.in_game==true:
		get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "isaac_notebook")
		Global.progress="name_select"
		pass


##################
#transition functions

func _on_1f_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/Main_hall.tscn")


func _on_toilet_2f_body_entered(body):
	if Global.progress=="explore_2nd_floor":
		get_node("player/CanvasLayer/NinePatchRect").show_text("1", "toilet_not_enter")
	else:
		if body==get_node("player"):
			 SceneTransition.change_scene("res://scenes/second_floor/toilet_2f.tscn")
	pass # Replace with function body.


func _on_Jenny_room_body_entered(body):
	if body==get_node("player"):
		if Global.progress=="find_rachel_bag":
			get_node("player/CanvasLayer/NinePatchRect").show_text("intro_mono", "jenny_door_locked")
		else:
			SceneTransition.change_scene("res://scenes/second_floor/jenny_room.tscn")
	pass # Replace with function body.


func _on_ben_room_body_entered(body):
	if body==get_node("player"):
		if Global.progress=="find_rachel_bag":
			Global.speak="intro_mono, ben_door_locked"
			get_node("player/CanvasLayer/NinePatchRect").show_text("intro_mono", "ben_door_locked")
		#SceneTransition.change_scene("res://scenes/second_floor/ben_room.tscn")
	pass # Replace with function body.


func _on_bishop_room_body_entered(body):
	if body==get_node("player"):
		if Global.progress=="find_rachel_bag":
			get_node("player/CanvasLayer/NinePatchRect").show_text("intro_mono", "henry_door_locked")
		else:
			SceneTransition.change_scene("res://scenes/second_floor/bishop_room.tscn")
	pass # Replace with function body.


func _on_max_room_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/second_floor/max_room.tscn")
	pass # Replace with function body.


func _on_game_room_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/second_floor/game_room.tscn")
	pass # Replace with function body.


func _on_third_floor_body_entered(body):
	get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "back_to_the_bedroom", 0)
	pass # Replace with function body.


####################################
#event functions

func _on_meet_emily_body_entered(body):
	#print (body)
	Global.can_move=false
	get_node("AnimationPlayer").play("emily_meet")
	get_node("player/AnimatedSprite").animation="idle_up"
	get_node("player/CanvasLayer/NinePatchRect").on_dialog=true

func enter_ben_door_code():
	get_node("player/code").show()
	print ("aaa")
	pass

####################################
#chapter setup functions

func start_emily_meeting():
	get_node("invisible_event_walls/CollisionPolygon2D").position = Vector2(-3.29,11.106)
	get_node("invisible_event_walls/CollisionPolygon2D2").position = Vector2(12.773,20.316)
	get_node("actions/meet_emily/CollisionShape2D").position= Vector2(2741.51,327.099)
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "emily_meet":
		Global.speak = "intro, emily_meet"
		get_node("player/CanvasLayer/NinePatchRect").show_text("intro", "emily_meet")
		get_node("actions/meet_emily/CollisionShape2D").position= Vector2(1083.608,-53.982)
	if anim_name == "emily_meet_leave":
		Global.speak =""
		Global.progress = "met_emily"
		
	if anim_name == "isaac_meet_leave":
		pass
	get_node("player").speed =80   ##Player shoud be able to move after the animation is done

func _on_AnimationPlayer_animation_started(anim_name):
	get_node("player").speed=0         ##The character chouldn't move during the animation
	pass # Replace with function body.
