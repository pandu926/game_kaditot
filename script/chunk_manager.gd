extends Node2D

@onready var player = get_parent().get_parent().get_node("player")
@onready var ch = $"../loadedChunk"

# Ukuran chunk (misalnya 16x16 grid)
const CHUNK_SIZE = Vector2(16, 16)
const VIEW_DISTANCE = 2  # Jarak chunk yang dimuat dari pemain (radius)

# Dictionary untuk menyimpan chunk yang sedang dimuat
var loaded_chunks: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_position = player.global_position
	update_chunks(player_position)

# Hitung index chunk berdasarkan posisi global
func get_chunk_index(global_position: Vector2) -> Vector2:
	return Vector2(
		floor(global_position.x / CHUNK_SIZE.x),
		floor(global_position.y / CHUNK_SIZE.y)
	)

# Muat chunk
func load_chunk(chunk_index: Vector2):
	if chunk_index in loaded_chunks:
		return  # Chunk sudah dimuat
	
	var chunk_scene = preload("res://scene/stage_chunk.tscn")  # Memuat PackedScene
	var chunk = chunk_scene.instantiate() # Membuat instance dari scene
 # Instance prefab chunk di sini
	chunk.position = chunk_index * CHUNK_SIZE
	ch.add_child(chunk)
	loaded_chunks[chunk_index] = chunk

# Unload chunk
func unload_chunk(chunk_index: Vector2):
	if chunk_index in loaded_chunks:
		loaded_chunks[chunk_index].queue_free()
		loaded_chunks.erase(chunk_index)

# Perbarui chunk berdasarkan posisi pemain
func update_chunks(player_position: Vector2):
	var current_chunk = get_chunk_index(player_position)
	var chunks_to_keep = []

	# Muat chunk di sekitar pemain
	for x in range(-VIEW_DISTANCE, VIEW_DISTANCE + 1):
		for y in range(-VIEW_DISTANCE, VIEW_DISTANCE + 1):
			var chunk_index = current_chunk + Vector2(x, y)
			chunks_to_keep.append(chunk_index)
			if chunk_index not in loaded_chunks:
				load_chunk(chunk_index)
	
	# Unload chunk yang tidak diperlukan
	for chunk_index in loaded_chunks.keys():
		if chunk_index not in chunks_to_keep:
			unload_chunk(chunk_index)
