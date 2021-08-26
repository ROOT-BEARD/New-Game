extends Node2D

onready var scoreCounter = $CanvasLayer/Score/Label
onready var dishes = $"YSort/sink 3/Dishes"

var score = 0

func _ready():
	$samantha.play()


func _on_Dishes_did_dishes():
	score += 200
	scoreCounter.text = "Score: %s" % score
	$CanDoDishesAgain.start()

func new_penguin():
	var penguin = load("res://penguin.tscn").instance()
	get_node("YSort").add_child(penguin)


func _on_NewPenguinTimer_timeout():
	new_penguin()


func _on_Player_took_out_trash():
	score += 200
	scoreCounter.text = "Score: %s" % score

func _on_CanDoDishesAgain_timeout():
	dishes.can_do_dishes = true

func _on_Bed_made_bed():
	score += 200
	scoreCounter.text = "Score: %s" % score
