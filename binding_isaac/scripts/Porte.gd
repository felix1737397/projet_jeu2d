extends Area2D

var ouvrir = false

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _process(delta):
	if ouvrir == true:
		if Input.is_action_just_pressed("E"):
			get_tree().change_scene("res://scenes/map3.tscn")




func _area_entered(object):  
	if object.is_in_group("bozo"):
		ouvrir = true


func _area_exited(object):    
	ouvrir = false
