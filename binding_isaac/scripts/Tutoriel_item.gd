extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	if Input.is_action_just_pressed("x"):
		get_tree().change_scene("res://scenes/Tutoriel.tscn")
	
	pause()
				
func pause():
	

	if Input.is_action_just_pressed("esc"):
		get_tree().paused = true
		$MarginContainer/Popup.show()
		$CanvasModulate.set_color(Color(1,0,0))
		
		
	print(get_tree().paused)
	
	if get_tree().paused == false:
		$MarginContainer/Popup.hide()
		$CanvasModulate.set_color(Color(1,1,1,1))


			
		

		

		
	
		
		
	
			
			

		
	
	
	
	

		

			
		

	
