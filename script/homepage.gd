extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	center_object()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_screen_resized():
	center_object()


func center_object():
	# Mendapatkan ukuran layar saat ini
	var screen_size = get_viewport().get_visible_rect().size
	# Memusatkan objek di layar
	position = screen_size / 2

# Callback untuk memonitor perubahan ukuran layar
func _enter_tree():
	get_viewport().connect("size_changed", Callable(self, "_on_screen_resized"))




func _on_new_game_pressed() -> void:
	var next_scene = load("res://scen/stage 1.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scen/stage 1.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")


func _on_exit_pressed() -> void:
	get_tree().quit()

	
