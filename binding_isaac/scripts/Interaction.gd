extends Area2D

var clef = preload("res://scenes/Clef.tscn")
var ouvrir
var once = true

func _ready():   
	connect("body_entered" , self, "_area_entered")     
	connect("body_exited" , self, "_area_exited")     
 

func _process(delta):
	if ouvrir == true:
		if Input.is_action_just_pressed("E"):
			$StaticBody2D/Coffre.play("Ouvre")
			VariableGlobales.joueur_clef = true;
			if once == true:
				var a = clef.instance()
				get_parent().add_child(a)
				once = false
				


func _area_entered(object):  
	if object.is_in_group("bozo"):
		ouvrir = true


func _area_exited(object):    
	ouvrir = false
