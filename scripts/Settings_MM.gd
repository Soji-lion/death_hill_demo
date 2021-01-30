extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
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
	pass # Replace with function body.


func _on_Button2_button_up():
	Global.reset_dialog=true
	"res://dialogues/english.lan"
	
	pass # Replace with function body.
