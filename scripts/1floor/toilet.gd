extends StaticBody2D

var anim = ""
var animNew = ""
var animNode
var next_to = false
var which_state="close"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	animNode = get_node("AnimatedSprite")
	animNode.play("close_idle")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if next_to==true&&Input.is_action_just_pressed("action"):
		if which_state=="open":
			close_door()
		elif which_state=="close":
			open_door()
	
	pass

func open_door():
	anim = "toilet_open"
	if anim != animNew:
		animNew=anim
		animNode.play(anim)
		get_node("Timer").start(1)
		get_node("door").position=Vector2(50,-600)
		get_node("speak").position=Vector2(0,20)
		which_state="open"
	pass
	
func close_door():
	anim = "toilet_close"
	if anim != animNew:
		animNew=anim
		animNode.play(anim)
		get_node("Timer").start(1)
		get_node("door").position=Vector2(0,21)
		get_node("speak").position=Vector2(96,-101)
		which_state="close"
	pass


func _on_Timer_timeout():
	
	pass # Replace with function body.


func _on_speak_body_entered(body):
	Global.speak="toilet"
	pass # Replace with function body.


func _on_enter_body_entered(body):
	next_to=true
	pass # Replace with function body.


func _on_enter_body_exited(body):
	next_to=false
	pass # Replace with function body.


func _on_speak_body_exited(body):
	Global.speak=""
	pass # Replace with function body.
