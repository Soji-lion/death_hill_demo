extends CanvasLayer

signal scene_changed()

onready var animation_player = $AnimationPlayer
onready var fader = $Control/colorRect

func change_scene(path):
	Global.can_move=false
	animation_player.play("fade_in")
	yield(animation_player,"animation_finished")
	assert(get_tree().change_scene(path)==OK)
	animation_player.play_backwards("fade_in")
	yield(animation_player,"animation_finished")
	Global.can_move=true
	#emit_signal("scene_changed")

func change_scene_fade_out(path):
	Global.can_move=false
	assert(get_tree().change_scene(path)==OK)
	animation_player.play_backwards("fade_in")
	yield(animation_player,"animation_finished")
	Global.can_move=true
	#emit_signal("scene_changed")

#-----used in different place! do not "optimise"!-----#
func fade_in():
	animation_player.play("fade_in")
	yield(animation_player,"animation_finished")

func fade_out():
	animation_player.play_backwards("fade_in")
	yield(animation_player,"animation_finished")
