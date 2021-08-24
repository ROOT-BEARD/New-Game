extends Node2D

onready var scoreCounter = $CanvasLayer/Score/Label

var score = 0


func _on_Dishes_did_dishes():
	score += 100
	scoreCounter.text = "Score: %s" % score
