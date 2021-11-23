extends Area2D

var objet
var target = false
var speed = 300

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _process(delta):
	if target == true:
		$Particles2D.set_emitting(true)
		yield(get_tree().create_timer(.5), "timeout")
		$Coin.set_visible(false)
		$Shadow.set_visible(false)
		yield(get_tree().create_timer(.5), "timeout")
		queue_free()



func _area_entered(object):  
	if object.is_in_group("bozo"):
		target = true
		objet = object
		print(target)


func _area_exited(object):    
	target = false
