extends Area2D

@export var jump_boost = 900
@onready var anime = $AnimatedSprite2D

# Fungsi dipanggil saat objek masuk ke Area2D
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Pastikan hanya player yang terdeteksi
		anime.play("default")  # Ganti animasi ke "default"
		
		 # Frame 3-5
		if body.has_method("apply_jump_boost"):  # Jika player punya metode apply_jump_boost
			body.apply_jump_boost(jump_boost)  # Tambahkan boost lompatan
		 # Tidak ada boost jika frame tidak sesuai

# Fungsi dipanggil saat objek keluar dari Area2D
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):  # Pastikan hanya player yang terdeteksi
		anime.play("idle")  # Kembali ke animasi "idle"
