extends KinematicBody2D

export var speed = 400
export var friction = 0.2
export var acceleration = 0.05
export var runspeed = 400

onready var animationPlayer = $AnimationPlayer

var velocity = Vector2()

var play_idle = true

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		input.x += 1
		$Sprite.flip_h = true
	if Input.is_action_pressed('left'):
		input.x -= 1
		$Sprite.flip_h = false
	if Input.is_action_pressed('down'):
		input.y += 1
	if Input.is_action_pressed('up'):
		input.y -= 1
	if Input.is_action_just_pressed("run"):
		speed += runspeed
	elif Input.is_action_just_released("run"):
		speed -= runspeed
	
	
	return input

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
	

func _on_Area2D_area_entered(area):
	if area.is_in_group("interactable"):
		if Input.is_action_just_pressed("interact"):
			print_debug("poop")