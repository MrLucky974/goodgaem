extends Control


func _on_Button_pressed():
	get_tree().change_scene("res://game/GameScene.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://game/MainMenu.tscn")
