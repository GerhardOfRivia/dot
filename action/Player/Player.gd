extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

var velocity = Vector2.ZERO
const MAX_SPEED = 200
const STRENGTH = 75

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_key_pressed(KEY_W) and not Input.is_key_pressed(KEY_S):
		input_vector.y = -1
	elif Input.is_key_pressed(KEY_S) and not Input.is_key_pressed(KEY_W):
		input_vector.y = 1
	
	if Input.is_key_pressed(KEY_A) and not Input.is_key_pressed(KEY_D):
		input_vector.x = -1
	elif Input.is_key_pressed(KEY_D) and not Input.is_key_pressed(KEY_A):
		input_vector.x = 1
		
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_state.travel("Run")
		velocity = velocity.move_toward(input_vector * STRENGTH, MAX_SPEED)
	else:
		animation_state.travel("Idle")
		velocity = Vector2.ZERO

	velocity = move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
