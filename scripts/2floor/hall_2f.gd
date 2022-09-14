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
	
	if Global.progress == "find_out_more":
#		get_node("player").position=Vector2(543, 575)
		get_node("Isaac").position=Vector2(456, 307)
		get_node("Isaac").animation="idle_right"
	elif  Global.progress=="refused_to_work" or Global.progress=="refused_to_work_again":
		get_node("Isaac").position=Vector2(456, 307)
		get_node("Isaac").animation="idle_right"
	get_node("player").change_direction()
	Global.room="hall2f"
	

func _input(event):
	if event.is_action("action"):
		if Global.whom_to_speak=="Isaac"&&Global.is_in_dialogue==false:
			if Global.progress=="find_out_more"&&Global.restart_count==0:
				Global.speak="isaac_meet"
				Global.progress="temp"
				get_node("player/CanvasLayer/NinePatchRect").show_text("main","isaac_meet", 0)
			elif Global.progress=="refused_to_work"&&Global.restart_count==0:
				Global.speak="isaac_i_changed_mind"
				get_node("player/CanvasLayer/NinePatchRect").show_text("main", "isaac_i_changed_mind")
			elif Global.progress=="refused_to_work"&&Global.restart_count==1:
				Global.speak="isaac_i_changed_mind_again"
				get_node("player/CanvasLayer/NinePatchRect").show_text("main", "isaac_i_changed_mind_re")
			elif Global.progress=="refused_to_work"&&Global.restart_count>=2:
				Global.speak="isaac_i_changed_mind_again_re"
				get_node("player/CanvasLayer/NinePatchRect").show_text("main", "isaac_i_changed_mind_rere")
	pass


func _process(delta):
	if Global.speak=="whats_going_on":
		BgMusic.pitch_scale=1.15
	elif Global.speak=="where_is_exit":
		BgMusic.pitch_scale=1.20
	elif Global.speak=="isaac_calming":
		BgMusic.pitch_scale=0.8
	
	if get_node("player/CanvasLayer/NinePatchRect").finished_dialog:
		if Global.speak=="where_is_exit":
			Global.progress="refused_to_work"
			Global.speak=""
		elif Global.speak=="isaac_calming":
			SceneTransition.fade_in()
			Global.speak="isaac_despair_end"
			get_node("player/CanvasLayer/NinePatchRect").show_text("main", "isaac_despair_end")
		elif Global.speak=="isaac_despair_end":
			Global.endings[0]=true
			SceneTransition.change_scene_fade_out("res://scenes/Main_menu.tscn")
#	pass

##################
#transition functions

func _on_1f_body_entered(body):
	if body==get_node("player"):
		SceneTransition.change_scene("res://scenes/Main_hall.tscn")


func _on_toilet_2f_body_entered(body):
	if body==get_node("player"):
		if Global.progress=="find_out_more":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "find_out_more_first")
		elif Global.progress=="refused_to_work":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "leave_this_place")
		else:
			if body==get_node("player"):
				#SceneTransition.change_scene("res://scenes/second_floor/toilet_2f.tscn")
				get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "toilet_not_enter")

	pass # Replace with function body.


func _on_Jenny_room_body_entered(body):
	if body==get_node("player"):
		if Global.progress=="find_out_more":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "find_out_more_first")
		elif Global.progress=="refused_to_work":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "leave_this_place")
			#SceneTransition.change_scene("res://scenes/second_floor/jenny_room.tscn")
			pass # Replace with function body.


func _on_ben_room_body_entered(body):
	if body==get_node("player"):
		if Global.progress=="find_out_more":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "find_out_more_first")
		elif Global.progress=="refused_to_work":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "leave_this_place")
		#SceneTransition.change_scene("res://scenes/second_floor/ben_room.tscn")
	pass # Replace with function body.


func _on_bishop_room_body_entered(body):
	if body==get_node("player"):
		if Global.progress=="find_out_more":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "find_out_more_first")
		elif Global.progress=="refused_to_work":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "leave_this_place")
#			SceneTransition.change_scene("res://scenes/second_floor/bishop_room.tscn")
			pass # Replace with function body.


func _on_max_room_body_entered(body):
	if body==get_node("player"):
		if Global.progress=="find_out_more":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "find_out_more_first")
		elif Global.progress=="refused_to_work":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "leave_this_place")
			#SceneTransition.change_scene("res://scenes/second_floor/max_room.tscn")
	pass # Replace with function body.


func _on_game_room_body_entered(body):
	if body==get_node("player"):
		if Global.progress=="find_out_more":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "find_out_more_first")
		elif Global.progress=="refused_to_work":
			get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "leave_this_place")
		#SceneTransition.change_scene("res://scenes/second_floor/game_room.tscn")
	pass # Replace with function body.


func _on_third_floor_body_entered(body):
	get_node("player/CanvasLayer/NinePatchRect").show_text("extra", "third_floor", 0)
	pass # Replace with function body.


