extends KinematicBody2D

var vie = 2 


func hit():
	vie -=1 
	if vie == 0:
		$Vase.play("Brise")
		$CollisionShape2D.queue_free()
