extends Node

#var test = 0
#func _ready():

#func _process(delta):
	#test = 1000+randi()%8999 #int(round(rand_range(1000, 9999)))
	#print (test)


var is_inv_now = false		#check if there's an ongoing search or anything that required a bite limit
var bites = 0							#how many actions can be done before is_inv_now becomes false

######################
# Key Plot Variables #
######################

####rachel_bag_search####
var rb_found = false
var rb_richard = false
var rb_isaac = false
var rb_emily = false
var rb_cabinet = false
var rb_ben_room = false
#########################
