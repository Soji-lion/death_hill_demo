extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var loaded = false
var address = {
	"main_hall":"res://scenes/Main_hall.tscn",
	"clothes":"res://scenes/clothes.tscn",
	"tea_room":"res://scenes/tea_room.tscn",
	"library":"res://scenes/library.tscn",
	"toilet_1f":"res://scenes/toilet_1f.tscn",
	"lunch_room":"res://scenes/lunch_room.tscn",
	"basement_entrance":"res://scenes/basement_entrance.tscn",
	"pantry":"res://scenes/pantry.tscn",
	"kitchen":"res://scenes/kitchen.tscn",
	"g_cabinet":"res://scenes/g_cabinet.tscn",
	"cabinet":"res://scenes/cabinet.tscn",
	"main_secret":"res://scenes/main_secret.tscn",
	"family_dining":"res://scenes/family_dining.tscn",
	"archives":"res://scenes/second_floor/archives.tscn",
	"hall2f":"res://scenes/second_floor/hall_2f.tscn",
	"toilet_2f":"res://scenes/second_floor/toilet_2f.tscn",
	"ben_room":"res://scenes/second_floor/ben_room.tscn",
	"jenny_room":"res://scenes/second_floor/jenny_room.tscn",
	"bishop_room":"res://scenes/second_floor/bishop_room.tscn",
	"max_room":"res://scenes/second_floor/max_room.tscn",
	"game_room":"res://scenes/second_floor/game_room.tscn",
	}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var game_stats = "user://save1.dat"
var game_settings = "user://save2.dat"

func _process(delta):
	if Input.is_action_just_pressed("save")&&Global.can_save_now==true:
		save_game()
		
		
	
	if Input.is_action_just_pressed("load"):
		load_game(game_stats, game_settings)
	pass

func save_settings():
	var content = {
	"language":Global.language,
	"volume": BgMusic.get_volume()
		}
	var file = File.new()
	var error = file.open(game_settings, File.WRITE)
	if error == OK:
		file.store_var(Global.language, BgMusic.get_volume())
		
		file.close()

func save_game():
	#TO DO: implement <=3 save files
	var content = {
	"room":Global.room,
	"is_in_dialog":Global.is_in_dialogue,
	"speak":Global.speak,
	"episode":Global.episode,
	"progress":Global.progress,
	"char_name":Global.char_name,
	"player_position":Global.player_position,
	"can_move":Global.can_move
}
	var file = File.new()
	
	var error = file.open(game_stats, File.WRITE)
	if error == OK:
		file.store_var(Global.room)
		file.store_var(Global.is_in_dialogue)
		file.store_var(Global.speak)
		file.store_var(Global.episode)
		file.store_var(Global.progress)
		file.store_var(Global.char_name)
		file.store_var(Global.player_position)
		file.store_var(Global.can_move)
		
		file.close()
	pass

func load_settings(set_path):
	var file = File.new()
	if file.file_exists(set_path):
		var error = file.open(set_path, File.READ)
		if error == OK:
			Global.language = file.get_var()
			BgMusic.change_volume(file.get_var())
			file.close()
		
		



func load_game(path, set_path):
	var file=File.new()
	var file1=File.new()
	if file.file_exists(path):
		if file1.file_exists(set_path):
			var error = file.open(path, File.READ)
			var error1 = file1.open(set_path, File.READ)
			print("loaded game")
			if error == OK&&error1 == OK:
				Global.room=file.get_var()
				print (Global.room)
				Global.is_in_dialogue=file.get_var()
				Global.speak=file.get_var()
				Global.language=file1.get_var()
				Global.episode=file.get_var()
				Global.progress=file.get_var()
				Global.char_name=file.get_var()
				Global.player_position=file.get_var()
				Global.can_move=file.get_var()
				file.close()
				get_tree().change_scene(address[Global.room])
				loaded = true
		else:
			var error = file.open(path, File.READ)
			print("loaded game")
			if error == OK:
				Global.room=file.get_var()
				print (Global.room)
				Global.is_in_dialogue=file.get_var()
				Global.speak=file.get_var()
				Global.language="res://dialogues/russian.lan"
				Global.episode=file.get_var()
				Global.progress=file.get_var()
				Global.char_name=file.get_var()
				Global.player_position=file.get_var()
				Global.can_move=file.get_var()
				file.close()
				get_tree().change_scene(address[Global.room])
				loaded = true
			
	pass
