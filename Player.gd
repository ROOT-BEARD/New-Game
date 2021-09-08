extends KinematicBody2D

signal play_transition

export var speed = 400
export var friction = 0.2
export var acceleration = 0.05
export var runspeed = 400

onready var animationPlayer = $AnimationPlayer
onready var timer = $DeadTimer
onready var bat = $bat

var velocity = Vector2()

var state = MOVE
var can_move = true
var is_dead = false

enum{
	dishes,
	has_garbage,
	ungloging_toilet,
	walking, 
	MOVE
}


func get_input():
	if can_move == true && is_dead == false:
		var input = Vector2()
		if Input.is_action_pressed('right'):
			input.x += 1
			$Sprite.flip_h = true
			#trash_bag.position.x = 60
			#trash_bag.flip_h = true
		if Input.is_action_pressed('left'):
			input.x -= 1
			$Sprite.flip_h = false
			#trash_bag.position.x = -60
			#trash_bag.flip_h = false
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


func move_state():
	if can_move == true && is_dead == false:
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


func get_velocity():
	return velocity

func get_position():
	return position

# warning-ignore:unused_argument
func _physics_process(delta):
	
	bat.look_at(get_global_mouse_position())
	
	match state:
		MOVE:
			move_state()


func _on_Area2D_area_entered(area):
	if area.is_in_group("Enemy"):
		$Sprite.hide()
		timer.start()
		can_move = false


func _on_DeadTimer_timeout():
	get_tree().change_scene("res://gameOver.tscn")
