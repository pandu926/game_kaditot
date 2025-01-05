extends RichTextLabel

@export var typing_speed: float = 0.08 # Kecepatan mengetik (detik per karakter)
@export var story_text: String = "Suatu wanita di sebuah desa yang masih sangat kental dengan tradisi mistis. Namun, ada rahasia yang tersembunyi di balik keindahan desa tersebut. Mampukah ia mengungkap kebenaran?"
@export var next_scene_path: String = "res://scen/stage 1.tscn" # Path ke scene berikutnya
var current_text = "" # Teks yang sedang diketik
var sentences: Array = [] # Array untuk menyimpan kalimat-kalimat
var current_sentence_index: int = 0 # Indeks kalimat yang sedang ditampilkan

func _ready():
	sentences = story_text.split(". ") # Pecah cerita menjadi kalimat-kalimat
	if sentences.size() > 0:
		await start_typing()

func start_typing():
	while current_sentence_index < sentences.size():
		current_text = "" # Reset teks untuk kalimat baru
		var sentence = sentences[current_sentence_index]
		for i in sentence.length():
			current_text += sentence[i] # Tambahkan satu karakter
			text = current_text # Perbarui teks di RichTextLabel
			await get_tree().create_timer(typing_speed).timeout # Tunggu sebelum lanjut
		await get_tree().create_timer(1).timeout # Beri jeda setelah kalimat selesai
		current_sentence_index += 1 # Pindah ke kalimat berikutnya
	# Setelah semua kalimat selesai, pindah ke scene berikutnya
	change_to_next_scene()

func change_to_next_scene():
	Savemanager.unlock_scene("stage1")
	if next_scene_path != "":
		var next_scene = load("res://scen/stage 1.tscn")  # Pastikan path benar
		if next_scene:  # Cek apakah scene berhasil dimuat
			get_tree().change_scene_to_file("res://scen/stage 1.tscn")  # Ganti scene dengan aman
		else:
			print("Gagal memuat scene. Periksa path!")
	else:
		print("Path scene berikutnya belum diatur.")
