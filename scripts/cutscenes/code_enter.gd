extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var dig_1 = get_node("ColorRect/Label2")
onready var dig_2 = get_node("ColorRect/Label3")
onready var dig_3 = get_node("ColorRect/Label4")
onready var dig_4 = get_node("ColorRect/Label5")

var first = 5
var second = 8
var third = 1
var fourth = 0
var answer = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	dig_1.text = str(first)
	dig_2.text = str(second)
	dig_3.text = str(third)
	dig_4.text = str(fourth)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_up():
	if PlotTree.is_inv_now==true:
		answer=dig_1.text+dig_2.text+dig_3.text+dig_4.text
		PlotTree.bites= PlotTree.bites-1
		pass # Replace with function body.


func _on_arr_1_pressed():
	if first!=9:
		first+=1
	else:
		first=0
	dig_1.text = str(first)
	pass # Replace with function body.


func _on_arr_2_pressed():
	if second!=9:
		second+=1
	else:
		second=0
	dig_2.text = str(second)
	pass # Replace with function body.


func _on_arr_3_pressed():
	if third!=9:
		third+=1
	else:
		third=0
	dig_3.text = str(third)
	pass # Replace with function body.


func _on_arr_4_pressed():
	if fourth!=9:
		fourth+=1
	else:
		fourth=0
	dig_4.text = str(fourth)
	pass # Replace with function body.


func _on_arr_5_pressed():
	if first !=0:
		first-=1
	else:
		first=9
	dig_1.text = str(first)
	pass # Replace with function body.


func _on_arr_6_pressed():
	if second!=0:
		second-=1
	else:
		second=9
	dig_2.text = str(second)
	pass # Replace with function body.


func _on_arr_7_pressed():
	if third!=0:
		third-=1
	else:
		third=9
	dig_3.text = str(third)
	pass # Replace with function body.


func _on_arr_8_pressed():
	if fourth!=0:
		fourth-=1
	else:
		fourth=9
	dig_4.text = str(fourth)
	pass # Replace with function body.
