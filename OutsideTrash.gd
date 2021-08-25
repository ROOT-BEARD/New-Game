extends StaticBody2D

onready var player = get_node("../Player")
onready var pushE = $"push E"

var can_push_e = true
var has_trash = false

# warning-ignore:unused_argument
func _physics_process(delta):
	if player.get_can_get_trash() == true:
		can_push_e = true
	else:
		can_push_e = false
	
	if player.get_has_trash_bag() == true:
		has_trash = true
	else:
		has_trash = false
	
	if can_push_e == false:
		pushE.hide()
	

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player") && can_push_e == true && has_trash:
		pushE.show()


func _on_Area2D_area_exited(area):
	if area.is_in_group("Player") && can_push_e == true && has_trash:
		pushE.hide()
