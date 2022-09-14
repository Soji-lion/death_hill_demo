extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_event_body_entered(body):
	print (body)
	if body==get_tree().get_root().find_node("player",true,false):
	#get_node("player"):
		Global.whom_to_speak="Isaac"

func _on_event_body_exited(body):
	if body==get_tree().get_root().find_node("player",true,false):
		Global.whom_to_speak=""
	pass # Replace with function body.
