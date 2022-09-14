extends Node


var room = "default" 				#the room that the character just came from
var is_in_dialogue = false			#checks, if the SMRT is started (should not be used as SMRT has its own bool for that(but that bool is only accessible from the character scene))
var speak = ""						#checks, which dialog is launched (or is ready to be launched)
var whom_to_speak=""				#who will speak to the player. used when !="" and "e" is pressed
var language="res://dialogues/eng.lan"		#stores the current game language
var reset_dialog=false
var in_game = false
var progress = ""					#tracks game progress
var episode = ""					#same as above, but within episode (on the smaller scale)
var temp_progress = ""				#should be the same value as progress. If not, it will update the
									#event triggers to match the progress stored in "var progress" 
var char_name = "???"				#the character name used in the SMRT system
var can_save_now = true				#bool to see if we are in the middle of cutscene, ?paused?, dead, etc.
var player_position					#shouldn't be used anywhere (leftover)
var selected_option = -1			#part of SMRT_option_selection system
var char_direction = ""				#saves character orientation for the next room
var can_move = true					#if false, player won't be able to move the character
var char_position = 0				#used when the same room is reloaded to make player stay on the same place

##These vars are only used in Demo.
var restart_count=0
var endings=[false, false, false]
#func _process(delta):
#	print(speak)
#cannot save if is_in_dialog==true or if can_save_now/in_game==false

# ^ - Is it TODO? or finished?
#^^ its finished
