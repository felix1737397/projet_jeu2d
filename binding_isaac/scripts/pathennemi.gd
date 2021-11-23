extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var chemin = $PathFollow2D


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
		chemin.offset += 100*delta



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
