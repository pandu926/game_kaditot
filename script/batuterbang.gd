extends Area2D


@export var speed: float = 10.0
var direction = Vector2(1, 0)  # Arah default ke kanan



func _on_body_entered(body: Node2D) -> void:
	
	body.dead()
