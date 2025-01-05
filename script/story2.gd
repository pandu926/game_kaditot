extends Node2D

@onready var logo = $"."
  # Gantilah dengan path ke DialogueManager Anda

func _ready() -> void:
	# Mulai dengan fade-in
	fade_in()

# Fungsi untuk fade-in
func fade_in() -> void:
	logo.modulate.a = 0.0  # Mulai dengan transparansi 0 (tersembunyi)
	var tween = create_tween()
	tween.tween_interval(2.0)  # Durasi fade-in 2 detik
	
	# Animasi fade-in (modifikasi properti modulate:a)
	await tween.tween_property(logo, "modulate:a", 1.0, 2.0)
	
	# Setelah fade-in selesai, tampilkan dialog
	show_dialogue()

# Fungsi untuk menampilkan dialog
func show_dialogue() -> void:
	DialogueManager.show_example_dialogue_balloon(load("res://dialog/dialogueRaja.dialogue"), "start")
	# Tunggu hingga dialog selesai
	await DialogueManager.dialogue_ended
	# Setelah dialog selesai, lakukan fade-out
	fade_out()

# Fungsi untuk fade-out
func fade_out() -> void:
	var tween = create_tween()
	tween.tween_interval(2.0)  # Durasi fade-out 2 detik
	
	# Animasi fade-out
	await tween.tween_property(logo, "modulate:a", 0.0, 2.0)
	next_scene()
	
func next_scene():
	
	var next_scene = load("res://scene/stage2.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scene/stage2.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")
