extends Node

var act = 0 #this changes between dialogue sessions!




signal dialogue()
signal collected(itemName)
signal clearItem
signal toRight
signal toLeft
signal spawnitem(id)

signal checkpos(pos)

var currentItemID = -1

#for events and global variables!

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("collected",collect)
	pass # Replace with function body.

func collect(id):
	currentItemID = id
	act +=1
	pass
	
func checkForItem(id):
	if currentItemID == id:
		return true
	else:
		return false

func clear(id):
	currentItemID = -1
	emit_signal("clearItem", id)
