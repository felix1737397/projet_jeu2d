extends Control





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tutoriel_pressed():
		get_tree().change_scene("res://scenes/Tutoriel.tscn")


func _on_Quitter_pressed():
		get_tree().quit()


func _on_Controles_pressed():
		get_tree().change_scene("res://scenes/Controles.tscn")
		


func _on_Jouer_pressed():
		get_tree().change_scene("res://scenes/Map.tscn")
	
