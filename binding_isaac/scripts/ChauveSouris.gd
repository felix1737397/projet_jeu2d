extends KinematicBody2D


var target = null
var vie = 2
export(int) var speed = 300    
 

func _process(delta):
	if target:
		var velocity = global_position.direction_to(target.global_position)
		move_and_collide(velocity * speed * delta)


func _area_entered(object): 
	print('in') 
	if object.is_in_group("bozo"):
		target = object


func _area_exited(object):  
	print('out')   
	target = false
