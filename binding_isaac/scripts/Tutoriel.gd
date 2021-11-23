extends Node2D




func _ready():
	pass 


func _physics_process(delta):
	
	pause()
				
func pause():
	
	if Input.is_action_just_pressed("esc"):
		$MarginContainer/Popup.show()
		$CanvasModulate.set_color(Color(1,0,0))
		
		
		


