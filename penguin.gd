extends KinematicBody2D


onready var player = get_node("../Player")
onready var soft_collision = $SoftCollision
var velocity = Vector2()
const move_speed = 250


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func follow_player(delta):
	# Use the distance formula to see how close the penguin is to the player. If it is close enough,
	# it doesn't have to move anymore
	if abs(sqrt(((position.x - player.get_position().x) * (position.x - player.get_position().x)) + 
			   ((position.y - player.get_position().y) * (position.y - player.get_position().y)))) < 100:
		pass
	else:
		position = position.move_toward(player.get_position(), delta * move_speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (soft_collision.is_colliding() &&
		!abs(sqrt(((position.x - player.get_position().x) * (position.x - player.get_position().x)) + 
				((position.y - player.get_position().y) * (position.y - player.get_position().y)))) < 100):
		velocity += soft_collision.get_push_vector() * delta * 10
	velocity = move_and_slide(velocity)
	follow_player(delta)
