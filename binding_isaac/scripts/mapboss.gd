extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
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


			
		
