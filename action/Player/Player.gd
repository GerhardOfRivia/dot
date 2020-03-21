extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

var velocity = Vector2.ZERO
const MAX_SPEED = 150
const STRENGTH = 50

var state = ["idel_right", null]
onready var animation_player = $AnimationPlayer

func _process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_key_pressed(KEY_W) and not Input.is_key_pressed(KEY_S):
		input_vector.y = -STRENGTH
		state = ["idel_up", "run_up"]
	elif Input.is_key_pressed(KEY_S) and not Input.is_key_pressed(KEY_W):
		input_vector.y = STRENGTH
		state = ["idel_down", "run_down"]
	
	if Input.is_key_pressed(KEY_A) and not Input.is_key_pressed(KEY_D):
		input_vector.x = -STRENGTH
		state = ["idel_left", "run_left"]
	elif Input.is_key_pressed(KEY_D) and not Input.is_key_pressed(KEY_A):
		input_vector.x = STRENGTH
		state = ["idel_right", "run_right"]
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector, MAX_SPEED)
		animation_player.play(state[1])
	else:
		velocity = Vector2.ZERO
		animation_player.play(state[0])

	velocity = move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
