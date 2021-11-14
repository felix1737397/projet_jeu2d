extends Area2D

var ouvrir

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _process(delta):
	if ouvrir == true:
		if Input.is_action_just_pressed("E"):
			$StaticBody2D/Coffre.play("Ouvre")


func _area_entered(object):  
	ouvrir = true


func _area_exited(object):    
	ouvrir = false
