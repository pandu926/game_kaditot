extends CanvasLayer

@onready var player = get_parent().get_node("player") 
@onready var animated_sprite = player.get_node("AnimatedSprite2D")  # Pastikan path ke node Player benar
var speed = 500  # Kecepatan pergerakan player
var velocity = Vector2.ZERO  # Simpan arah gerakan di luar proses
var is_jumping = false  # Status untuk melacak apakah karakter sedang melompat
var jump_force = -600  # Kekuatan lompatan
var gravity = 20  # Gaya gravitasi untuk jatuh
var is_on_ground = false  # Status untuk mendeteksi apakah karakter berada di lantai
var jump_max = 2

@onready var right = $Node/RIGHT
@onready var left = $Node/LEFT
@onready var up = $Node/UP



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Bisa ditambahkan inisialisasi jika dibutuhkan

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Perbarui posisi player berdasarkan velocity
	if velocity != Vector2.ZERO:
		player.position += velocity.normalized() * speed * delta  # Update posisi player

# Fungsi yang dipanggil saat tombol ditekan
func _on_up_pressed() -> void:
	up.modulate.a = 0.5 # Mainkan animasi lompatan


func _on_down_pressed() -> void:
	velocity.y = 1  # Gerak ke bawah

func _on_left_pressed() -> void:
	print("kanan")

func _on_right_pressed() -> void:
	print("kiri")
	

# Fungsi yang dipanggil saat tombol dilepas
func _on_up_released() -> void:
	up.modulate.a = 1.0 # Kembali ke animasi idle saat tombol dilepas

func _on_down_released() -> void:
	velocity.y = 0  # Hentikan gerakan vertikal jika tombol dilepas

func _on_left_released() -> void:
	velocity.x = 0  # Hentikan gerakan horizontal jika tombol dilepas
	animated_sprite.play("idle")

func _on_right_released() -> void:
	velocity.x = 0  # Hentikan gerakan horizontal jika tombol dilepas
	animated_sprite.play("idle")


func _on_button_pressed() -> void:
	var next_scene = load("res://scene/homepage.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scene/homepage.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")
