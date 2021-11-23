extends Area2D

var ouvrir = false
var salle = 0
export var endroit = "res://scenes/Principale.tscn"

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _process(delta):
		if ouvrir == true:
			if Input.is_action_just_pressed("E"):
				get_tree().change_scene(endroit)




func _area_entered(object):  
	if object.is_in_group("bozo"):
		ouvrir = true


func _area_exited(object):    
	ouvrir = false
