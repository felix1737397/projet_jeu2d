extends Area2D
onready var path_follow = get_parent()

export var _speed = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(delta):
	path_follow.set_offset(path_follow.get_offset() + _speed * delta)
