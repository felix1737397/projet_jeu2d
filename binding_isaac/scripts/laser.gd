extends KinematicBody2D

var velocity = Vector2()
var speed = 300

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		queue_free()
		print(collision.collider.name)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
