extends Node2D

onready var scoreCounter = $CanvasLayer/Score/Label
onready var next_task = $CanvasLayer/WhatToDoNext
onready var dishes = $"YSort/sink 3/Dishes"
onready var bed = $YSort/Bed
onready var toilet = $YSort/toilet
onready var player = $YSort/Player


var score = 0

# warning-ignore:unused_argument
func _physics_process(delta):
	if next_task.go_make_bed == true:
		bed.can_make_bed = true
	else:
		bed.can_make_bed = false
	
	if next_task.go_do_dishes == true:
		dishes.can_do_dishes = true
	else:
		dishes.can_do_dishes = false

	if next_task.go_unglog_toilet == true:
		toilet.can_unclog_toilet = true
	else:
		toilet.can_unclog_toilet = false
	

func _on_Dishes_did_dishes():
	score += 200
	scoreCounter.text = "Score: %s" % score
	next_task.pick_chore()

func new_penguin():
	var penguin = load("res://penguin.tscn").instance()
	get_node("YSort").add_child(penguin)

func _on_NewPenguinTimer_timeout():
	new_penguin()


func _on_Bed_made_bed():
	score += 200
	scoreCounter.text = "Score: %s" % score
	next_task.pick_chore()

func _on_toilet_uncloged_toilet():
	score += 200
	scoreCounter.text = "Score: %s" % score
	next_task.pick_chore()
