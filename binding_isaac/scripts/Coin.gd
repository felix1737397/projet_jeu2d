extends Area2D

var objet
var target = false
var speed = 300
var pris = false

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _process(delta):
	if target == true:
		if pris == false:
			VariableGlobales.joueur_argent += 1
			pris = true
			
			
		$Particles2D.set_emitting(true)

		yield(get_tree().create_timer(1), "timeout")
		queue_free()



func _area_entered(object):  
	if object.is_in_group("bozo"):
		target = true
		objet = object
		print(target)


func _area_exited(object):    
	target = false
