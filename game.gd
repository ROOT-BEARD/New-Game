extends Node2D


func save(score):
	var file = File.new()
	file.open("user://save_score.dat", File.WRITE)
	file.store_var(score, false)
	file.close()
