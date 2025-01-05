extends CharacterBody2D


const SPEED = 530.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var ya = get_parent().get_node("controller")


@onready var animated_sprite = $AnimatedSprite2D


func apply_jump_boost(boost: float) -> void:
	velocity.y = -boost
	
func dead(): 
	print("player died")

	ya.is_dead()
	
func respawn(check: Vector2):
	global_position = check  # Set ulang posisi pemain ke checkpoint
	ya.is_life()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("ui_down"):
		animated_sprite.play("attack")
		
	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("walk")
	else:
		animated_sprite.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
