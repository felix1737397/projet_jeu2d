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
		$MarginContainer/Popup.show()
		print("test")
		$CanvasModulate.set_color(Color(1,0,0))
		yield(get_tree().create_timer(2.0), "timeout")	
		
		if Input.is_action_just_pressed("esc"):
			$MarginContainer/Popup.hide()
			
			

		
	
	
	
	

		

			
		

	
