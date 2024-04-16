extends Camera2D

var leftpos
var rightpos
# Called when the node enters the scene tree for the first time.
func _ready():
	leftpos = global_position.x - 960
	rightpos = global_position.x + 960
	glob.connect("checkpos", check)
	pass # Replace with function body.

func sleep():
	print(name + "is sleeping")
	enabled = false

func check(pos):
	#print(pos)
	#print("WOAHAHA")
	if pos > leftpos and pos < rightpos:
		print(pos)
		#get_tree().call_group("cams","sleep")
		enabled = true
		print(name + "woke up")
	else:
		sleep()
		
	

