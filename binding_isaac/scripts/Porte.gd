extends Area2D

var coin = preload("res://scenes/coin.tscn")
var ouvrir = false

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _process(delta):
	if ouvrir == true:
		if Input.is_action_just_pressed("E"):
			var a = coin.instance()
			get_parent().add_child(a)




func _area_entered(object):  
	if object.is_in_group("bozo"):
		ouvrir = true


func _area_exited(object):    
	ouvrir = false
