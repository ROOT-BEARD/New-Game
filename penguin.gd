extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_node("../Player")
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_velocity = player.get_velocity()
	print_debug(player_velocity)
	velocity = move_and_slide(player_velocity)
	pass
