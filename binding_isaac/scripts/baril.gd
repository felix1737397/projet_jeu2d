extends Node2D

var vie = 2 


func hit():
	vie -=1 
	if vie == 0:
		$baril.play("Brise")
		queue_free()
