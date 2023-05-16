class_name Falling
extends Node2D

export var is_bad = false

onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var speed = 1

func _ready():
	randomize()
	speed = rand_range(2, 5)

func _process(delta):
	var velocity = Vector2(0, gravity * speed * delta)
	translate(velocity)

func pick_up(player : Node2D) -> void:
	if is_bad:
		player.eat_cock()
	else:
		player.eat_ass()
	
	queue_free()
