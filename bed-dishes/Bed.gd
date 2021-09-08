extends StaticBody2D

var can_make_bed = false
var can_push_e = false

signal made_bed

onready var animationPlayer = $"hold e/AnimationPlayer"
onready var sprite = $"hold e/Sprite"


# warning-ignore:unused_argument
func _physics_process(delta):
	if can_push_e == true && can_make_bed:
		if Input.is_action_just_pressed("E"):
			animationPlayer.play("play")
		elif Input.is_action_just_released("E"):
			animationPlayer.play("eee")


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		if can_make_bed:
			can_push_e = true
			sprite.show()
			animationPlayer.play("eee")
		else:
			can_push_e = false

func _on_Area2D_area_exited(area):
	if area.is_in_group("Player"):
		if can_make_bed:
			can_push_e = false
			animationPlayer.play("stop")
			sprite.hide()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "play":
		can_make_bed = false
		print_debug("you made your bed")
		emit_signal("made_bed")
