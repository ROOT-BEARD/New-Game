extends KinematicBody2D


func _physics_process(delta):
	var playerPos = get_node("../Player").global_position
	
	if playerPos.x > self.global_position.x:
		$Sprite.flip_h = true
	elif playerPos.x < self.global_position.x:
		$Sprite.flip_h = false
