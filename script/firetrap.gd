extends AnimatableBody2D

@onready var fire = $fire  # Referensi ke objek fire
@onready var firebox = $firebox  # Referensi ke objek firebox
@onready var colli = $Area2D/CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	firebox.play("default")  # Pastikan animasi firebox dimulai

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_frame = firebox.frame  # Ambil frame saat ini dari firebox
	
	# Menampilkan fire hanya pada frame 7-10 dari firebox (indeks 6 hingga 9)
	if current_frame >= 4 and current_frame <= 9:  # Frame 7-10
		fire.visible = true  # Tampilkan fire
		fire.play("fire")  # Mulai animasi fire
		colli.disabled = false
	else:
		fire.visible = false  # Sembunyikan fire
		colli.disabled = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
