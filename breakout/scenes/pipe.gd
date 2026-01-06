extends CharacterBody2D

const GRAVITY : int = 1000
const MAX_VEL : int = 600
const FLAP_SPEED : int = -500
const START_POS = Vector2(432, 400) 
var moving : bool = false

func _ready() -> void:
	reset()

func reset() -> void:
	moving = false
	position = START_POS

func _physics_process(delta: float) -> void:
	pass
