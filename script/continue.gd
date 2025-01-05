extends CanvasLayer

@onready var play_buttons = []
@onready var label = $Label  # Pastikan ini mengarah ke node Label di scene

func _ready():
	for child in $".".get_children():
		if child is Button:
			play_buttons.append(child)
	update_scene_buttons()

func update_scene_buttons():
	var all_disabled = true  # Asumsikan semua tombol *disabled* pada awalnya

	for button in play_buttons:
		var scene_name = button.name
		var is_unlocked = Savemanager.is_scene_unlocked(scene_name)
	

		button.disabled = not is_unlocked
		button.visible = is_unlocked  # Sembunyikan tombol jika tidak tersedia

		if is_unlocked:
			all_disabled = false  # Ada tombol yang tidak *disabled*

	# Periksa apakah semua tombol *disabled*
	if all_disabled:
		label.visible = true

	else:
		label.visible = false



func _on_stage_1_pressed() -> void:
	var next_scene = load("res://scen/stage 1.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scen/stage 1.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")

func _on_stage_2_pressed() -> void:
	var next_scene = load("res://scene/stage2.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scene/stage2.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")

func _on_stage_3_pressed() -> void:
	var next_scene = load("res://stage3.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://stage3.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")

func _on_stage_4_pressed() -> void:
	var next_scene = load("res://stage4.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://stage4.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")


func _on_touch_screen_button_pressed() -> void:
	print("ok")
	var next_scene = load("res://scene/Homepage.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scene/Homepage.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")
