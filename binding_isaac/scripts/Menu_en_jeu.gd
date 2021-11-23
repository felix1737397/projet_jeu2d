extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Retour_pressed():
	print("test")
	get_tree().change_scene("res://scenes/Menu_principal.tscn")


func _on_Quitter_pressed():
	get_tree().quit()


func _on_Reprendre_pressed():
	get_tree().paused = false;


