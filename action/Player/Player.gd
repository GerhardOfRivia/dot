extends KinematicBody2D

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
const MAX_SPEED = 200
const STRENGTH = 75

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
		ROLL:
			roll_state(delta)
		
		ATTACK:
			attack_state(delta)
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
		
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		velocity = Vector2.ZERO
	elif input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_tree.set("parameters/Attack/blend_position", input_vector)
		animation_state.travel("Run")
		velocity = velocity.move_toward(input_vector * STRENGTH, MAX_SPEED)
	else:
		animation_state.travel("Idle")
		velocity = Vector2.ZERO

	velocity = move_and_slide(velocity)


func roll_state(delta):
	pass

func attack_state(delta):
	velocity = Vector2.ZERO
	animation_state.travel("Attack")

func attack_complete():
	state = MOVE
