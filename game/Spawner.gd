extends Node2D

onready var timer = $Timer

onready var ass = preload("res://objects/Ass.tscn")
onready var eggplant = preload("res://objects/Eggplant.tscn")

func _ready():
	spawn()
	timer.start()

func spawn():
	var rand = rand_range(0, 1)
	
	var rand_position = Vector2(rand_range(48, 1920 - 48), 0)
	
	if rand > .5:
		var instance = ass.instance()
		add_child(instance)
		instance.position = rand_position
	else:
		var instance = eggplant.instance()
		add_child(instance)
		instance.position = rand_position

func _on_Timer_timeout():
	spawn()
