extends KinematicBody2D

class_name Player

export (int) var speed = 80

const IDLE_SPEED = 10
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var RayNode

var global_pos

var PlayerAnimNode
var anim = ""
var animNew = ""
onready var SPEAK = get_node("CanvasLayer/NinePatchRect")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	set_physics_process(true)
	
	RayNode = get_node("RayCast2D")
	
	PlayerAnimNode = get_node("AnimatedSprite")
func _physics_process(delta):
	if SaveLoad.loaded==true:
		get_node(".").position = Global.player_position
		SaveLoad.loaded=false
	global_pos = get_node(".").global_position
	Global.player_position = global_pos
	var motion = Vector2()
	
	if Global.can_move==true:
		if (Input.is_action_pressed("ui_up")):
			
			motion +=Vector2.UP
			RayNode.set_rotation_degrees(180)
			
		if(Input.is_action_pressed("ui_down")):
			motion+=Vector2.DOWN
			RayNode.set_rotation_degrees(0)
		if (Input.is_action_pressed("ui_left")):
			
			motion +=Vector2.LEFT
			RayNode.set_rotation_degrees(-90)
			
		if(Input.is_action_pressed("ui_right")):
			motion+=Vector2.RIGHT
			RayNode.set_rotation_degrees(90)
		
		motion = motion.normalized()*speed #*delta
		#move_and_collide(motion)
		move_and_slide(motion)
	
	if (get_node("CanvasLayer/NinePatchRect").on_dialog==false):
		if (motion.length()>IDLE_SPEED*0.09):
			if(Input.is_action_pressed("ui_up")):
				anim = "walk_up"
			if(Input.is_action_pressed("ui_down")):
				anim = "walk_down"
			if(Input.is_action_pressed("ui_left")):
				anim = "walk_left"
			if(Input.is_action_pressed("ui_right")):
				anim = "walk_right"
		else:
			if (RayNode.get_rotation_degrees()==180):
				anim="idle_up"
			if (RayNode.get_rotation_degrees()==0):
				anim="idle_down"
			if (RayNode.get_rotation_degrees()==-90):
				anim="idle_left"
			if (RayNode.get_rotation_degrees()==90):
				anim="idle_right"
	else:
		if (RayNode.get_rotation_degrees()==180):
			anim="idle_up"
		if (RayNode.get_rotation_degrees()==0):
			anim="idle_down"
		if (RayNode.get_rotation_degrees()==-90):
			anim="idle_left"
		if (RayNode.get_rotation_degrees()==90):
			anim="idle_right"
	if anim != animNew:
		animNew = anim
		Global.char_direction=anim
		if Global.char_direction=="walk_up":
			Global.char_direction="idle_up"
		
		if Global.char_direction=="walk_down":
			Global.char_direction="idle_down"
		
		if Global.char_direction=="walk_left":
			Global.char_direction="idle_left"
		
		if Global.char_direction=="walk_right":
			Global.char_direction="idle_right"
		
		PlayerAnimNode.play(anim)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_NinePatchRect_finished_dialog():
	get_node(".").speed=80
	pass # Replace with function body.


func _on_NinePatchRect_started():
	get_node(".").speed=0
	
	pass # Replace with function body.

func change_direction():
	if Global.char_direction=="idle_up":
		get_node("RayCast2D").set_rotation_degrees(180)
	if Global.char_direction=="idle_down":
		get_node("RayCast2D").set_rotation_degrees(0)
	if Global.char_direction=="idle_left":
		get_node("RayCast2D").set_rotation_degrees(-90)
	if Global.char_direction=="idle_right":
		get_node("RayCast2D").set_rotation_degrees(90)
