extends Node

const SAVE_FILE_PATH: String = "res://save_data.json"

var scene_statuses: Dictionary = {} # Menyimpan status scene (contoh: {"Scene1": true, "Scene2": false})

func _ready():
	load_save_data()

func load_save_data():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	if file:
		var json = JSON.new() # Membuat instance JSON
		var parse_result = json.parse(file.get_as_text()) # Parse JSON
		file.close()
		if parse_result == OK: # Cek jika parsing berhasil
			scene_statuses = json.get_data() # Ambil data hasil parsing
		else:
			print("JSON Parse Error: ", json.get_error_message()) # Ambil pesan error
			initialize_save_data()
	else:
		initialize_save_data()

func initialize_save_data():
	# Inisialisasi default: Semua scene terkunci kecuali scene pertama
	scene_statuses = {
		"stage1": true, # Scene pertama terbuka
		"stage2": false,
		"stage3": false,
		"stage4": false
	}
	save_data()

func save_data():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	if file:
		var json = JSON.new() # Membuat instance JSON
		var json_text = json.stringify(scene_statuses) # Konversi ke JSON string
		file.store_string(json_text)
		file.close()

func unlock_scene(scene_name: String):
	if scene_name in scene_statuses:
		scene_statuses[scene_name] = true
		save_data()

func is_scene_unlocked(scene_name: String) -> bool:
	return scene_statuses.get(scene_name, false)
