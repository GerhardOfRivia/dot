extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

var velocity = Vector2.ZERO
const MAX_SPEED = 50
const STRENGTH = 1

func _process(delta):
	if Input.is_key_pressed(KEY_W) and not Input.is_key_pressed(KEY_S):
		velocity.y = -STRENGTH
	elif Input.is_key_pressed(KEY_S) and not Input.is_key_pressed(KEY_W):
		velocity.y = STRENGTH
	else:
		velocity.y = 0
	
	if Input.is_key_pressed(KEY_A) and not Input.is_key_pressed(KEY_D):
		velocity.x = -STRENGTH
	elif Input.is_key_pressed(KEY_D) and not Input.is_key_pressed(KEY_A):
		velocity.x = STRENGTH
	else: 
		velocity.x = 0
		
	velocity.normalized()

	move_and_collide(velocity * delta * MAX_SPEED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
