extends Area2D

var objet
var target = false

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _process(delta):
	if target == true:
		queue_free()

func _area_entered(object):  
	if object.is_in_group("bozo"):
		objet = object
		if VariableGlobales.joueur_argent >= 2:
			VariableGlobales.joueur_vie += 1
			VariableGlobales.joueur_argent -= 2
			target = true


func _area_exited(object):    
	target = false
