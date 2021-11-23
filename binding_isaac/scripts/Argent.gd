extends Label



# Affiche le nombre de points du joueur.
func _process(delta):
	
	
	var label = get_node("/root/Hud/Map/Texte_argent")
		
	
	label.text = str(VariableGlobales.joueur_argent)
