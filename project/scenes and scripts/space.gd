extends Area2D


func _ready():
	print(name)
func _on_body_entered(body):
	body.gravity = Vector2(-100,0)
	body.inspace = true
	


func _on_body_exited(body):
	body.gravity = Vector2(0,900)
	#print("cya nerd")
	body.inspace = false
	glob.emit_signal("checkpos",body.global_position.x)
