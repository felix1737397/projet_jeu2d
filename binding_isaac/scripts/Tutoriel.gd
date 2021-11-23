extends Node2D


func _ready():
	pass 


func _physics_process(delta):
	
	pause()
	
				
func pause():
	

	if Input.is_action_just_pressed("esc"):
		get_tree().paused = true
		$MarginContainer/Popup.show()
		$CanvasModulate.set_color(Color(1,0,0))
		
		
	
	if get_tree().paused == false:
		$MarginContainer/Popup.hide()
		$CanvasModulate.set_color(Color(1,1,1,1))
		
		
		


