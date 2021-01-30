extends Control

#signal name_saved



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var ch_name = get_node("ColorRect/name").text
	Global.char_name = ch_name
	print (Global.char_name)
	#emit_signal("name_saved")
	pass # Replace with function body.
