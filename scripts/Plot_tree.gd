extends Node

#var test = 0
#func _ready():

var is_inv_now = false		#check if there's an ongoing search or anything that required a bite limit
var bites = 0							#how many actions can be done before is_inv_now becomes false


######################
# Key Plot Variables #
######################
var emily_rel=0;
var rachel_rel=0;
var richard_rel=0;
var isaac_rel=0;
var ben_rel=0;
#Add more var's here



####rachel_bag_search####
var rb_found = false
var rb_richard = false
var rb_isaac = false
var rb_emily = false
var rb_cabinet = false
var rb_ben_room = false
#########################

######################
# 	Main Logic #
######################

func _process(delta):
	if is_inv_now==true:
		#if the tasak is completed:
		if Global.progress=="find_rachel_bag":
			if rb_found==true:
				is_inv_now=false
				bites=0
				Global.progress="bag_found"
				if rb_richard == false:
					pass
				if rb_isaac == false:
					pass
				if rb_emily == false:
					pass
				if rb_cabinet == false:
					pass
				if rb_ben_room == false:
					pass
					print(Global.progress)
		#if the task was failed:
		if bites==0:
			is_inv_now = false
			###################
			#unique case scenarios:
			if Global.progress=="find_rachel_bag":
				Global.progress="kitchen_all_meet"
				print(Global.progress)
				if rb_found == false:
					pass
				if rb_richard == false:
					pass
				if rb_isaac == false:
					pass
				if rb_emily == false:
					pass
				if rb_cabinet == false:
					pass
				if rb_ben_room == false:
					pass
			
	#test = 1000+randi()%8999 #int(round(rand_range(1000, 9999)))
	#print (test)
	pass

