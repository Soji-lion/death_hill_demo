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
var save_path = "user://save1.dat"

func _process(delta):
	if Input.is_action_just_pressed("save")&&Global.can_save_now==true:
		save_game()
		
		
	
	if Input.is_action_just_pressed("load"):
		load_game(save_path)
		print("loaded game")
	pass


func save_game():
	#TO DO: implement <=3 save files
	var content = {
	"room":Global.room,
	"is_in_dialog":Global.is_in_dialogue,
	"speak":Global.speak,
	"language":Global.language,
	"episode":Global.episode,
	"progress":Global.progress,
	"char_name":Global.char_name,
	"player_position":Global.player_position
}
	var file = File.new()
	
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(Global.room)
		file.store_var(Global.is_in_dialogue)
		file.store_var(Global.speak)
		file.store_var(Global.language)
		file.store_var(Global.episode)
		file.store_var(Global.progress)
		file.store_var(Global.char_name)
		file.store_var(Global.player_position)
		
		file.close()
	pass

func load_game(path):
	var file=File.new()
	if file.file_exists(path):
		var error = file.open(path, File.READ)
		if error == OK:
			Global.room=file.get_var()
			print (Global.room)
			Global.is_in_dialogue=file.get_var()
			Global.speak=file.get_var()
			Global.language=file.get_var()
			Global.episode=file.get_var()
			Global.progress=file.get_var()
			Global.char_name=file.get_var()
			Global.player_position=file.get_var()
			file.close()
			get_tree().change_scene(address[Global.room])
			loaded = true
			
	pass
