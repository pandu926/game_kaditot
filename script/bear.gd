extends CharacterBody2D

@export var speed: float = 200  # Kecepatan horizontal musuh
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_chasing: bool = false  # Apakah musuh sedang mengejar
var player
@onready var animated = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Terapkan gravitasi
	
	if not is_on_floor():
		velocity.y += gravity * delta
	# Jika mengejar pemain, set kecepatan horizontal
	if is_chasing:
		var direction = (player.position - position).normalized()
		position += direction * (delta * speed)
		animated.play("attack")
		if (player.position - position) < Vector2(0,0):
			animated.flip_h=true
		else:
			animated.flip_h=false
	else:
		animated.play("idle")
	## Pindahkan musuh
	move_and_slide()

func _on_deteksi_body_entered(body: Node2D) -> void:
	if body.name == "player":
		is_chasing = true
		player = body

func _on_deteksi_body_exited(body: Node2D) -> void:
	if body.name == "player":
		is_chasing = false


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "player":
		get_tree().reload_current_scene()
