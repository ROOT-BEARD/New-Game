extends StaticBody2D

var can_unclog_toilet = true
var in_range_of_toilet = false

signal uncloged_toilet

onready var pushE = $RapidlyPressE
onready var progressBar = $RapidlyPressE/Control/ProgressBar

# warning-ignore:unused_argument
func _physics_process(delta):
	
	progressBar.value -= 10 * delta
	
	if can_unclog_toilet == false:
		pushE.hide()
	
	if in_range_of_toilet == true && can_unclog_toilet:
		pushE.show()
	else:
		pushE.hide()
	
	if Input.is_action_just_pressed("E") && in_range_of_toilet:
		if can_unclog_toilet == true:
			progressBar.value += 5
	
	if progressBar.value == 100:
		emit_signal("uncloged_toilet")
		in_range_of_toilet = false
		can_unclog_toilet = false

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player") && can_unclog_toilet:
		in_range_of_toilet = true
	else:
		in_range_of_toilet = false


func _on_Area2D_area_exited(area):
	if area.is_in_group("Player") && can_unclog_toilet:
		in_range_of_toilet = false
