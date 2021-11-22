extends Area2D

var changer_scene

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _process(delta):
	if changer_scene == true:
		get_tree().change_scene("res://scenes/Tutoriel_item.tscn")
		
		



func _area_entered(object):  
	changer_scene = true


func _area_exited(object):    
	changer_scene = false
