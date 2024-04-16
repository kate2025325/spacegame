extends Area2D


func _ready():
	print(name)
	
	
func _on_body_exited(body):
	glob.emit_signal("checkpos",body.global_position.x)
