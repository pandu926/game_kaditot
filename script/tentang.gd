extends CanvasLayer


func _on_touch_screen_button_pressed() -> void:
	var next_scene = load("res://scene/Homepage.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scene/Homepage.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")
