extends Node2D
@onready var cuscene  = $player/AnimationPlayer
@onready var player = $player/AnimatedSprite2D
@onready var backsound = $backsound
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	backsound.play()
	DialogueManager.show_example_dialogue_balloon(load("res://dialog/manbuk.dialogue"), "start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_detect_body_entered(body: Node2D) -> void:
	player.play("walk")
	cuscene.play("cutscene")
