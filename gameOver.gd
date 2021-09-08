extends Control


func _ready():
	$"play again".grab_focus()

func _on_menu_pressed():
	get_tree().change_scene("res://menu/menu.tscn")


func _on_play_again_pressed():
	get_tree().change_scene("res://World.tscn")
