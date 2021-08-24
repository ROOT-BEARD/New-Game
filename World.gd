extends Node2D

onready var scoreCounter = $CanvasLayer/Score/Label

var score = 0


func _on_Dishes_did_dishes():
	score += 100
	scoreCounter.text = "Score: %s" % score

func new_penguin():
	print_debug("New Penguin!!!")
	var penguin = load("res://penguin.tscn").instance()
	get_node("YSort").add_child(penguin)


func _on_NewPenguinTimer_timeout():
	new_penguin()


func _on_Player_took_out_trash():
	score += 200
	scoreCounter.text = "Score: %s" % score
