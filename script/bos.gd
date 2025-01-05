extends CharacterBody2D

@onready var char = $AnimatedSprite2D
@onready var ani = $AnimationPlayer
@onready var playe = $"../player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	char.flip_h = true

# Called every frame. 'delta' is the elapsed time since the previous frame
func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "player":
		ani.play("cut")
		char.play("default")
		DialogueManager.show_example_dialogue_balloon(load("res://dialog/dialogueStage2.dialogue"), "start")
		# Tunggu hingga dialog selesai
		await DialogueManager.dialogue_ended
		Savemanager.unlock_scene("stage2")
		fade_out()

func fade_out() -> void:
	var tween = create_tween()
	tween.tween_interval(2.0)  # Durasi fade-out 2 detik
	
	# Animasi fade-out
	next_scene()
	
func next_scene():
	Savemanager.unlock_scene("stage3")
	var next_scene = load("res://stage3.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://stage3.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")
