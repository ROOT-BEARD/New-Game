extends KinematicBody2D

export var speed = 400
export var friction = 0.2
export var acceleration = 0.05
export var runspeed = 400

onready var animationPlayer = $AnimationPlayer
onready var trash_bag = $TrashBag 

signal took_out_trash

var velocity = Vector2()
var can_take_trash_bag = true
var in_range_of_trash = false
var has_trash_bag = false
var in_range_of_outside_trash = false

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		input.x += 1
		$Sprite.flip_h = true
		trash_bag.position.x = 60
		trash_bag.flip_h = true
	if Input.is_action_pressed('left'):
		input.x -= 1
		$Sprite.flip_h = false
		trash_bag.position.x = -60
		trash_bag.flip_h = false
	if Input.is_action_pressed('down'):
		input.y += 1
	if Input.is_action_pressed('up'):
		input.y -= 1
	if Input.is_action_just_pressed("run"):
		speed += runspeed
		animationPlayer.playback_speed = 2
	elif Input.is_action_just_released("run"):
		speed -= runspeed
		animationPlayer.playback_speed = .75
	
	
	return input
	
func get_velocity():
	return velocity
	
func get_position():
	return position

func get_can_get_trash():
	return can_take_trash_bag
func get_has_trash_bag():
	return has_trash_bag

# warning-ignore:unused_argument
func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed('right'):
		animationPlayer.play("run")
	elif Input.is_action_pressed('left'):
		animationPlayer.play("run")
	elif Input.is_action_pressed('down'):
		animationPlayer.play("run")
	elif Input.is_action_pressed('up'):
		animationPlayer.play("run")
	else:
		animationPlayer.play("Idle")
	
	if has_trash_bag:
		trash_bag.show()
	else:
		trash_bag.hide()
	
	if Input.is_action_just_pressed("E"):
		if can_take_trash_bag:
			if in_range_of_trash == true:
				has_trash_bag = true
			if in_range_of_outside_trash == true:
				has_trash_bag = false
				emit_signal("took_out_trash")
				can_take_trash_bag = false

func _on_Area2D_area_entered(area):
	if area.is_in_group("trashcan"):
		in_range_of_trash = true
	if area.is_in_group("Out_Side_Trash"):
		in_range_of_outside_trash = true

func _on_Area2D_area_exited(area):
	if area.is_in_group("trashcan"):
		in_range_of_trash = false
	if area.is_in_group("Out_Side_Trash"):
		in_range_of_outside_trash = false
