extends Area2D

@onready var anime = $AnimatedSprite2D
@onready var stat = get_parent().get_parent().get_node("stat") 

@onready var coin_sound = $AudioStreamPlayer


func _ready() -> void:
	anime.play("default")
	#backsound.play()

func _on_body_entered(body: Node2D) -> void:
	
	coin_sound.play()
	anime.visible = false
	stat.add_point()
	await get_tree().create_timer(coin_sound.stream.get_length()).timeout
	queue_free()
		
