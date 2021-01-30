extends Polygon2D
var speaker = ""
var dialog 
var page 
#var pages

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if Input.is_action_just_pressed("action")&&Global.is_in_dialogue==true:
		if get_node("text").get_visible_characters()>get_node("text").get_total_character_count():
			
			
			get_node("text").set_bbcode(dialog)
			get_node("text").set_visible_characters(0)
		else:
			get_node("text").set_visible_characters(get_node("text").get_total_character_count())
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass


func _on_Timer_timeout():
	get_node("text").set_visible_characters(get_node("text").get_visible_characters()+1)
	pass # Replace with function body.

