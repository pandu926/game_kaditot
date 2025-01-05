extends Area2D



func _on_body_entered(body: Node2D) -> void:
	body.process_mode = Node.PROCESS_MODE_DISABLED
	DialogueManager.show_example_dialogue_balloon(load("res://dialog/masukPunden.dialogue"), "start")
	# Menghubungkan sinyal ketika dialog selesai
	await DialogueManager.dialogue_ended
	_on_dialogue_finished()

func _on_dialogue_finished() -> void:
	var next_scene = load("res://scene/stage 2 punden.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scene/stage 2 punden.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")
func _on_body_exited(body: Node2D) -> void:
	body.set_process(true)

func _on_detector_body_entered(body: Node2D) -> void:
	body.queue_free()
