extends AudioStreamPlayer
onready var audio = $"."

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func pause_bg():
	audio.playing=false
	pass

func play_bg():
	audio.playing=true
	
func change_bg(path_bg):
	audio.stream=path_bg

func change_volume(value):
	audio.volume_db=value
func get_volume():
	return audio.volume_db


#func _process(delta):
#	pass
