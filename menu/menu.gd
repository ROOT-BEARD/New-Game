extends Control

func _ready():
	$CanvasLayer/StartButton.grab_focus()



func _on_QuitButton_pressed():
	get_tree().quit()


func _on_StartButton_pressed():
	get_tree().change_scene("res://World.tscn")
