extends Node


var room = "default"
var is_in_dialogue = false
var speak = ""
var language="res://dialogues/russian.lan"
var reset_dialog=false
var in_game = false
var episode = ""
var progress = ""
var char_name = "???"
var can_save_now = true
var player_position
var selected_option = -1
#func _process(delta):

#cannot save if is_in_dialog==true or if can_save_now/in_game==false

# ^ - Это TODO? или уже готовое?
