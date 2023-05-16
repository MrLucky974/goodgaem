extends Node2D

onready var anim_player : AnimationPlayer = $AnimationPlayer
onready var score_label : Label = $CanvasLayer/Control/MarginContainer/Score
onready var lives_label : Label = $CanvasLayer/Control/MarginContainer/Lives

var lives = 3
var score = 0

func _ready():
	lives_label.text = "Lives : %d" % lives
	score_label.text = "Score : %d" % score

func _process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if position.x <= 96 and direction == -1:
		direction = 0
	
	if position.x >= 1920 - 96 and direction == 1:
		direction = 0
	
	translate(Vector2(direction, 0) * delta * 1000)
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://game/MainMenu.tscn")
	
	if lives <= 0:
		game_over()

func _on_Area2D_body_entered(body):
	var parent = body.get_parent()
	if parent is Falling:
		parent.pick_up(self)

func eat_ass():
	anim_player.play("ass")
	
	score += 1
	
	score_label.text = "Score: %d" % score
	
	yield(anim_player, "animation_finished")
	
	anim_player.play("normal")

func eat_cock():
	anim_player.play("cock")
	
	lives -= 1
	
	lives_label.text = "Lives: %d" % lives
	
	yield(anim_player, "animation_finished")
	
	anim_player.play("normal")

func game_over():
	get_tree().change_scene("res://game/GameOver.tscn")
