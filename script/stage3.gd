extends Node2D

@onready var panel = $CanvasLayer/panel
@onready var ya = $"."
@onready var okok = $CharacterBody2D3/AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel.visible = false

func pause():
	panel.visible = true
	get_tree().paused = true

func resume():
	panel.visible = false
	get_tree().paused = false


func _on_cancel_pressed() -> void:
	resume()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	Savemanager.unlock_scene("stage4")
	var next_scene = load("res://stage4.tscn")  # Pastikan path benar
	if next_scene:  # Cek apakah scene berhasil dimuat
		get_tree().change_scene_to_file("res://stage4.tscn")  # Ganti scene dengan aman
	else:
		print("Gagal memuat scene. Periksa path!")
