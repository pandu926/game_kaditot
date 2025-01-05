extends CharacterBody2D

@onready var dude = $AnimatedSprite2D

func _ready() -> void:
	dude.scale.x = -1
	dude.play("default")


func _on_detector_body_entered(body: Node2D) -> void:
	print("masuk area")


func _on_detector_body_exited(body: Node2D) -> void:
	print("keluae")
