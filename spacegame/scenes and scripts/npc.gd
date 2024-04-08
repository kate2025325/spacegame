extends CharacterBody2D


const SPEED = 500.0
const acceleration = 2000.0
const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var chatIcon

func _ready():
	chatIcon = $Control/chatIcon


func _physics_process(delta):
	pass
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()


func showChatIcon():
	#print("aaa")
	chatIcon.visible = true
	
func hideChatIcon():
	#print("bye")
	chatIcon.visible = false



func _on_mouse_input_mouse_entered():
	showChatIcon()
	pass # Replace with function body.


func _on_mouse_input_mouse_exited():
	hideChatIcon()
	pass # Replace with function body.


func _on_mouse_input_gui_input(event):
	#print("event happening? on npc??")
	if event is InputEventMouseButton:
		#mouse button action
		if event.pressed == true and event.button_index == 1:
			glob.emit_signal("dialogue")
			#its a left click
			#print("you clicked me lol")
			
	
	pass 
