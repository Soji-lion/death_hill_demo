extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var lang = get_node("Label2/OptionButton")
# Called when the node enters the scene tree for the first time.
func _ready():
	var file_path = "user://save2.dat"
	load_languages()
	SaveLoad.load_settings(file_path)
	get_node("Label3/HSlider").value=BgMusic.get_volume()
	if Global.language == "res://dialogues/english.lan":
		lang.select(0)
		pass
	elif Global.language =="res://dialogues/russian.lan":
		lang.select(1)
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_back_pressed():
	SceneTransition.change_scene("res://scenes/Main_menu.tscn")
	pass # Replace with function body.


func _on_Button_button_up():
	Global.language = "res://dialogues/russian.lan"
	Global.reset_dialog=true
	SaveLoad.save_settings()
	pass # Replace with function body.


func _on_Button2_button_up():
	Global.language = "res://dialogues/english.lan"
	Global.reset_dialog=true
	SaveLoad.save_settings()
	
	pass # Replace with function body.

func load_languages():
	lang.add_item("English")
	lang.add_item("Russian")


func _on_OptionButton_item_selected(index):
	if index == 0:
		Global.language = "res://dialogues/english.lan"
		Global.reset_dialog=true
		SaveLoad.save_settings()
		
	elif index == 1:
		Global.language = "res://dialogues/russian.lan"
		Global.reset_dialog=true
		SaveLoad.save_settings()
		
	pass # Replace with function body.


func _on_HSlider_value_changed(value):
	BgMusic.change_volume(value)
	pass # Replace with function body.


func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		BgMusic.play_bg()
	else:
		BgMusic.pause_bg()
	pass # Replace with function body.
