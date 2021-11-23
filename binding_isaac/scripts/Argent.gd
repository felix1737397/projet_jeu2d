extends Label

# Affiche le nombre de points du joueur.
func _process(delta):
	var label = get_node("/root/Map/Hud/Texte_argent")
	
	
	label.text = str(VariableGlobales.joueur_argent)
