extends StaticBody2D

onready var player = get_node("../Player")
onready var pushE = $"push E"

# warning-ignore:unused_argument
func _physics_process(delta):
	pass


# warning-ignore:unused_argument
func _on_Area2D_area_entered(area):
	if player.can_take_trash_bag:
		pushE.show()


# warning-ignore:unused_argument
func _on_Area2D_area_exited(area):
	if !player.can_take_trash_bag:
		pushE.hide()
