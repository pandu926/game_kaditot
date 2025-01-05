extends Control

@onready var logo = $logo
var time_elapsed = 0.0  # Variabel untuk melacak waktu yang telah berlalu
var transition_time = 4.0  # Waktu total dalam detik sebelum pindah scene



func _ready():
	start_blinking()

func _process(delta):
	# Tambahkan waktu yang berlalu setiap frame
	time_elapsed += delta
	if time_elapsed >= transition_time:
		var next_scene = load("res://scene/Homepage.tscn")  # Pastikan path benar
		if next_scene:  # Cek apakah scene berhasil dimuat
			get_tree().change_scene_to_file("res://scene/Homepage.tscn")  # Ganti scene dengan aman
		else:
			print("Gagal memuat scene. Periksa path!")
		time_elapsed = 0.0  # Reset waktu setelah pindah scene

func start_blinking():
	# Buat instance Tween dan tambahkan ke node
	var tween = self.create_tween()

	# Animasi kerlap-kerlip (fade in)
	tween.tween_property(
		logo, 
		"modulate:a", 
		1.0,    # Opasitas penuh (1.0)
		0.1     # Durasi fade in
	)
	
	# Animasi kerlap-kerlip (fade out)
	tween.tween_property(
		logo, 
		"modulate:a", 
		0,    # Opasitas rendah (0.5)
		0.5    # Durasi fade out
	)
	
	# Ulangi animasi (loop)
	tween.set_loops()  # Tween akan terus mengulang animasi
