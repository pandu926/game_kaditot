extends CanvasLayer

@onready var menu = get_parent().get_parent().get_node("Node2D") 

var score = 0
@onready var coin = $Control/jmlCoin
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ubah alignment dan direction teks
	coin.align = Label.ANCHOR_END  # Teks akan ter-align ke kanan
	#coin.valign = Label.VALIGN_CENTER  # Teks akan di-align secara vertikal di tengah

	
func add_point():
	score += 1
	coin.text =  str(score) 
	
func check_point():
	coin.text = "checkpoint"


func _on_button_pressed() -> void:
	print("yaayya")
	menu.pause()
