extends KinematicBody2D

var can_do_dishes = true
var can_push_e = false

onready var animationPlayer = $"hold e/AnimationPlayer"

func _physics_process(delta):
	if can_push_e == true:
		if Input.is_action_just_pressed("E"):
			animationPlayer.play("play")
		elif Input.is_action_just_released("E"):
			animationPlayer.play("stop")


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		can_push_e = true


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "play":
		can_do_dishes = false
