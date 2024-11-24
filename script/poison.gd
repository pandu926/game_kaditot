extends Area2D

@onready var animed = $"../AnimatedSprite2D"
@onready var colli = $colliDead
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_frame = animed.frame 
	if current_frame >= 11 and current_frame <= 15:  # Frame 7-10
		 # Mulai animasi fire
		colli.disabled = false
	else:
		colli.disabled = true



func _on_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
