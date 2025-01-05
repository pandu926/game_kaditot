extends Node2D
@onready var cuscene  = $player/AnimationPlayer
@onready var player = $player/AnimatedSprite2D
@onready var backsound = $backsound
@onready var notifier = $VisibleOnScreenNotifier2D


func _ready() -> void:
	DebugMenu.style = DebugMenu.Style.HIDDEN 
	DebugMenu.style = DebugMenu.Style.VISIBLE_COMPACT 
	DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED 


func _on_detect_body_entered(body: Node2D) -> void:
	player.play("walk")
	cuscene.play("cutscene")


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	self.show()



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.hide()


func _on_visible_on_screen_enabler_2d_screen_entered() -> void:
	self.show()


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	self.hide()
