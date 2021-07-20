extends Node


var room = "default" 				#the room that the character just came from
var is_in_dialogue = false			#checks, if the SMRT is started (should not be used as SMRT has its own bool for that(but that bool is only accessible from the character scene))
var speak = ""						#checks, which dialog is launched (or is ready to be launched)
var language="res://dialogues/russian.lan"		#stores the current game language
var reset_dialog=false
var in_game = false
var episode = "start_wakeup"		#tracks game progress
var progress = "awake"				#same as above, but within episode (on the smaller scale)
var temp_progress = ""				#should be the same value as progress. If not, it will update the
									#event triggers to match the progress stored in "var progress" 
var char_name = "???"				#the character name used in the SMRT system
var can_save_now = true				#bool to see if we are in the middle of cutscene, ?paused?, dead, etc.
var player_position					#shouldn't be used anywhere (leftover)
var selected_option = -1			#part of SMRT_option_selection system
#func _process(delta):

#cannot save if is_in_dialog==true or if can_save_now/in_game==false

# ^ - Это TODO? или уже готовое?
