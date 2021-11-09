extends Area2D

var ouvrir

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _area_entered(object):  
	ouvrir = true
	if Input.is_action_pressed("E"):
		$StaticBody2D/Coffre.play("Ouvre")


func _area_exited(object):    
	ouvrir = false
