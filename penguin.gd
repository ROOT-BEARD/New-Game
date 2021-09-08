extends KinematicBody2D

var speed = 125
var velocity = Vector2.ZERO

onready var player = get_node("../Player")
onready var playerPos = get_node("../Player").global_position

func _physics_process(delta):
	velocity = Vector2.ZERO
	velocity = position.direction_to(player.position) * speed
	velocity = move_and_slide(velocity)
	
	if velocity.x < 0:
		$Sprite.flip_h = false
	elif velocity.x > 0:
		$Sprite.flip_h = true
