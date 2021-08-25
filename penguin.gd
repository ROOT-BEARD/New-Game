extends KinematicBody2D


onready var player = get_node("../Player")
onready var soft_collision = $SoftCollision

var velocity = Vector2()
const move_speed = 250
var my_delta = 0
var is_in_player = false
var id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var num = get_tree().get_nodes_in_group("Penguin").size()
	if num > 5:
		id = num -4
	
func follow_player(delta):
	# Use the distance formula to see how close the penguin is to the player. If it is close enough,
	# it doesn't have to move anymore
	if (abs(sqrt(((position.x - player.get_position().x) * (position.x - player.get_position().x)) + 
			   ((position.y - player.get_position().y) * (position.y - player.get_position().y)))) < 
			   (200 + id * get_tree().get_nodes_in_group("Penguin").size())):
		pass
	else:
		position = position.move_toward(player.get_position(), delta * move_speed)
		
func push():
	velocity -= 100 * my_delta * 20
	print_debug(velocity)
	velocity = move_and_slide(velocity)
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		is_in_player = true
	
func _on_Area2D_area_exited(area):
	if area.is_in_group("Player"):
		is_in_player = false	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	my_delta = delta
	if (soft_collision.is_colliding() &&
		!abs(sqrt(((position.x - player.get_position().x) * (position.x - player.get_position().x)) + 
				((position.y - player.get_position().y) * (position.y - player.get_position().y)))) < 100):
		velocity += soft_collision.get_push_vector() * delta * 10
	velocity = move_and_slide(velocity)
	follow_player(delta)
	
	if is_in_player:
		push()
