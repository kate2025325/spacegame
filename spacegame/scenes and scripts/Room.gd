extends Node2D


var currentRoom = 0

var rooms = []
var plr

# Called when the node enters the scene tree for the first time.
func _ready():
	glob.connect("toLeft",left)
	glob.connect("toRight",right)
	plr = $"/root/main/player"
	
	for kid in get_children():
		rooms.append(kid)
	pass # Replace with function body.

func clearRoom(id):
	rooms[id].visible = false
	var children = rooms[id].get_children()
	for kid in children:
		if kid is StaticBody2D:
			kid.set_collision_layer_value(3, false)
		else: if kid.name == "npc":
			kid.get_node("mouseInput").visible == false
	
func loadRoom(id):
	print("loading room "+ str(id))
	rooms[id].visible = true
	#print(rooms[id].name)
	var children = rooms[id].get_children()
	for kid in children:
		if kid is StaticBody2D:
			kid.set_collision_layer_value(3, true)
			pass
		else: if kid.name == "npc":
			kid.get_node("mouseInput").visible == true
		
			
	pass
	#print(rooms[id].visible)


func left():
	clearRoom(currentRoom)
	currentRoom -= 1
	plr.global_position.x = 1990
	
	loadRoom(currentRoom)
	pass
	
func right():
	clearRoom(currentRoom)
	currentRoom += 1
	plr.global_position.x = -70
	

	loadRoom(currentRoom)
	
	pass
	
