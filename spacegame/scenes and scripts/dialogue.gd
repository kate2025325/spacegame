extends Control


const npcName = "Astronaut"
const plrName = "You"


var pos = 0

var nametag
var textbox
var plr

#dialogue database
var data = [
	
	#starting convo 0
	{dialogue =
		[
			{tag = npcName,
			line = "Hello there! this is a test because I don't know what to write"},
			
			{tag = plrName,
			line = "Hi, "+ npcName +". I don't quite know what to say either"},
			
			{tag = npcName,
			line = "WELL it looks like YOU need to DO SOMETHING!!! So go find me THIS SPECIFIC ITEM!!!!"},
			
			{tag = npcName,
			line = "You can find THIS SPECIFIC ITEM in the quarters!"},
			
			{tag = plrName,
			line = "Uh. Alright, I guess..."},
		],
	function = "nothing"}
,



#convo 1 - first item is found!
{dialogue =
		[
			{tag = npcName,
			line = "Hey! You found it! Nice job."},
			
			{tag = npcName,
			line = "You're pretty good at this, huh?"},
			
			{tag = npcName,
			line = "Howzabout you help me find some of my tools?"},
			
			{tag = plrName,
			line = "What's in it for me?"},
			
			{tag = npcName,
			line = "I mean. Without them, I can't fix our dud engine. And without the engine, you're never going home"},
			
			{tag = plrName,
			line = "THE ENGINE IS BROKEN??? How come I didn't know??"},
			
			{tag = npcName,
			line = "Comms are down too :)"},
			
			{tag = npcName,
			line = "Find me ANOTHER ITEM!!!! Good luck!"},
		],
	function = "clearnspawn",
	param = 1},
	
	{dialogue =
		[
			{tag = npcName,
			line = "Thanks, man. That's all for now!"},
			
			{tag = plrName,
			line = "Alright!"},
			
			{tag = npcName,
			line = "We'll add more items and things in the future :)"},
			
			{tag = npcName,
			line = "Bye!!!"},
			
		],
	function = "clear"}
]


# Called when the node enters the scene tree for the first time.
func _ready():
	plr = $"/root/main/player"
	glob.connect("dialogue",dial)
	nametag = $nametag/MarginContainer/tag
	textbox = $textpanel/MarginContainer/text
	pass # Replace with function body.
	
func clearnspawn(id):
	print("weeee")
	clear()
	spawn(id)
	
	
func spawn(id):
	glob.emit_signal("spawnitem",id)
	
func clear():
	if plr.get_node("item"):
		print("aaaa")
		plr.get_node("item").queue_free()
	#glob.emit_signal("clear",plr.get_node("item").get_meta("id"))
	closeBox()

func openBox():
	visible = true
	pass
	
func closeBox():
	visible = false
	print("closed dialogue box")
	
func nothing():
	#the dialogue ends with nothing, rather than something. Wow.
	closeBox()
	pass

func readLine():
	
	textbox.text = data[glob.act].dialogue[pos].line
	nametag.text = data[glob.act].dialogue[pos].tag
	
	
	pass


func dial():
	print("called!")
	if visible == true:
		pass
	else:
		openBox()
		pos = 0
		readLine()
	pass
	
	
func roll():
	#reads next line
	if data[glob.act].dialogue.size() > pos+1:
		pos += 1
		readLine()
		pass
	else:
		print("end of act")
		
		var call = Callable(self, data[glob.act].function)
		if data[glob.act].has("param"):
			call.callv([data[glob.act].param])
			print("works")
		else:
			print("no param")
			call.call()
			
		
	pass



func _on_gui_input(event):
	#print("something happened to this one instead")
	if event is InputEventMouseButton:
		if event.pressed == true and event.button_index == 1:
			#its a left click
			print("moving on to next dialogue")
			roll()
	pass # Replace with function body.
