extends Control


const npcName = "Bob"
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
			line = "Hello there, astronaut!"},
			
			{tag = plrName,
			line = "Hi, "+ npcName +". How ya doing?"},
			
			{tag = npcName,
			line = "Good until it all turned TERRIBLE!!! I lost my very precious slice of cake!!"},
			
			{tag = npcName,
			line = "Do you think you could find it for me?? I'd love it!"},
			
			{tag = plrName,
			line = "Uh. Alright, I guess..."},
		],
	function = "nothing"}
,



#convo 1 - first item is found!
{dialogue =
		[
			{tag = npcName,
			line = "Hey! You found it! YAYYYY!!!"},
			
			{tag = npcName,
			line = "You're pretty good at this, huh?"},
			
			{tag = npcName,
			line = "Howzabout you help me find my wrench?"},
			
			{tag = plrName,
			line = "What's in it for me?"},
			
			{tag = npcName,
			line = "I mean. Without them, I can't fix our dud engine. And without the engine, you're never going home."},
			
			{tag = plrName,
			line = "THE ENGINE IS BROKEN??? How come I didn't know??"},
			
			{tag = npcName,
			line = "Comms are down too :)"},
			
			{tag = npcName,
			line = "Good luck finding that wrench! Search as if your life depends on it!! Hah. Hah hah hah.. hah..."},
		],
	function = "clearnspawn",
	param = 1},
	
	{dialogue =
		[
			{tag = npcName,
			line = "Thanks, man. I can fix the engine with this!"},
			
			{tag = plrName,
			line = "Alright! Woo!"},
			
			{tag = npcName,
			line = "Now, the hardest part. I have no idea how to drive this dumb space boat."},
			
			{tag = plrName,
			line = "What—"},
			
			{tag = npcName,
			line = "SOOOO you will have to find the ship's operating manual!"},
			
			{tag = npcName,
			line = "I might have dropped it outside though..."},
			
			{tag = plrName,
			line = "Outside? Like. Outside?? The one thing that knows how to get this ship back home???"},
			
			{tag = npcName,
			line = "Whoopsie daisies."},
			
			{tag = npcName,
			line = "ANYWAY go find that BYE!!"},
			
		],
	function = "clearnspawn",
	param = 2},
	
	{dialogue =
		[
			{tag = npcName,
			line = "WOO! We can finally go home!"},
			
			{tag = plrName,
			line = "Thank gosh. I can finally see a face other than yours. That'll be a treat."},
			
			{tag = npcName,
			line = "Ow :("},
			
			{tag = npcName,
			line = "Well. Thanks for your help anyway! My loving wife and kids will be thrilled to have me back!"},
			
			{tag = plrName,
			line = "Let's just go home, " + npcName+"."},
			
			{tag = npcName,
			line = "Yep. On it."},
			
			{tag = "Thanks for playing!",
			line = "Developed by Kate Anderson. Assets curated by Luke Cornell. Music design by Sathvik Vemulapalli."}
			
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
