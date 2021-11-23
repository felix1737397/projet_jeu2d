extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	pause()
	
	$Hud/Texte_argent.text = str(VariableGlobales.joueur_argent)
	
	if VariableGlobales.joueur_vie == 2:
		$Hud/Vie2.show()
		
	else:
		$Hud/Vie2.hide()
		
	if VariableGlobales.joueur_vie <= 0:
		$Hud/Vie.hide()
		
	
	
	
			
func pause():
	

	if Input.is_action_just_pressed("esc"):
		get_tree().paused = true
		$MarginContainer/Popup.show()
		$CanvasModulate.set_color(Color(1,0,0))
		
		
		

	
	if get_tree().paused == false:
		$MarginContainer/Popup.hide()
		$CanvasModulate.set_color(Color(1,1,1,1))
		


			

