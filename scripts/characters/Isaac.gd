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
	if Global.room == "hall2f" && Global.progress == "met_emily":
		Global.speak="isaac_meet"
	pass # Replace with function body.
