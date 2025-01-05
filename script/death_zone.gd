extends Area2D

@onready var timer = $Timer
@onready var stat = get_parent().get_node("controller")

func _on_body_entered(body: Node2D) -> void:
	print("player died")
	body.dead()
	
