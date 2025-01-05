extends Area2D
# Called when the node enters the scene tree for the first time.



func _on_body_entered(body: Node2D) -> void:
	var pos = body.global_position
	print(pos)
	Check.emit_signal("checkpoint_reached", pos)
	
	
