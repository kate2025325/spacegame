extends CharacterBody2D

var collected = false
var plr

const weight = 1

func _ready():
	plr = $"/root/main/player"
	glob.connect("spawnitem",enable)
	

func _physics_process(delta):
	
	if collected == true:
		var target = plr.global_position + Vector2(150,0)
		global_position = lerp(global_position,target,weight*delta)
		

func enable(id):
	if id == get_meta("id"):
		set_meta("enabled", true)
	pass

func _on_area_2d_body_entered(body):
	if body.collision_layer == 1 and get_node("..").visible == true and get_meta("enabled") == true:
		if collected == false:
			print("GOTTEM")
			collected = true
			reparent(plr)
			#global_position = plr.global_position + Vector2(150,0)
			glob.emit_signal("collected",get_meta("id"))
		
	pass # Replace with function body.

func clear(id):
	if get_meta("id") == id:
		queue_free()
