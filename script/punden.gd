extends Area2D


# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node2D) -> void:
	print("memek")
   # Memuat scene baru secara dinamis
	var next_scene = load("res://scene/game.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scene/game.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")
