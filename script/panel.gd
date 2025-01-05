extends CanvasLayer

@onready var bg = $Control4/ColorRect
@onready var menu = get_parent().get_parent().get_parent().get_node("Node2D") 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bg.modulate.a = 0.5

func _on_button_3_pressed() -> void:
	menu.resume()


func _on_button_pressed() -> void:
	menu.get_tree().paused = false
	var next_scene = load("res://scene/Homepage.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://scene/Homepage.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")
