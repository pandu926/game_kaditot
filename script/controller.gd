extends CanvasLayer

@onready var player = get_parent().get_node("player") 
# Pastikan path ke node Player benar
var speed = 500  # Kecepatan pergerakan player
var velocity = Vector2.ZERO  # Simpan arah gerakan di luar proses
@onready var timer = $Timer
#
#@onready var right = $Node/RIGHT
#@onready var left = $Node/LEFT
@onready var up = $Node/UP
@onready var alert = $Control3/alert

#@onready var check = preload("res://scene/checkpoint.tscn")
var posisi 
var dead

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	Check.checkpoint_reached.connect(_on_checkpoint_reached)
	alert.visible = false;
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
	

func visible_alert():
	alert.visible = true;
	if dead:
		timer.wait_time = 0.5
		timer.start()

func is_dead(): 
	dead = true
	visible_alert()
func is_life(): 
	dead = false
	timer.stop()


func _on_kembali_pressed() -> void:
	var next_scene = load("res://scene/homepage.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scene/homepage.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")


func _on_timer_timeout() -> void:
	alert.visible = false
	dead = false
	player.respawn(posisi)
	

func _on_checkpoint_reached(position: Vector2):
	print(position)
	posisi = position

	
