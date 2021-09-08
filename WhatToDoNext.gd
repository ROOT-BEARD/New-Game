extends StaticBody2D

var last_number
var random_number
var maxValue = 3


enum {
	make_bed,
	do_dishes,
	unglog_toilet,
}

var go_make_bed = false
var go_do_dishes = false
var go_unglog_toilet = false


# warning-ignore:unused_argument
func _physics_process(delta):
	
	if random_number == last_number:
		pick_chore()
	
	
	if random_number == 1:
		$Control/Label.text = "make bed"
		go_make_bed = true
	else:
		go_make_bed = false
	
	if random_number == 2:
		$Control/Label.text = "do dishes"
		go_do_dishes = true
	else:
		go_do_dishes = false
	
	if random_number == 3:
		$Control/Label.text = "unglod toilet"
		go_unglog_toilet = true
	else:
		go_unglog_toilet = false
	
	if Input.is_action_just_pressed("ui_accept"):
		pick_chore()

func pick_chore():
	random_number = randi()%maxValue+1
	randomize()
