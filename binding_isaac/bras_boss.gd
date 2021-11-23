extends KinematicBody2D

var velocite = Vector2()

export var vie = 1
export var vitesse = 350

onready var pos_joueur = get_parent().get_node("Joueur")

func start(pos, dir):
	rotation = dir
	position = pos
	velocite = Vector2(vitesse, 5).rotated(rotation)
	
func _physics_process(delta):
	var dir = (pos_joueur.global_position - global_position).normalized()
	move_and_collide(dir * vitesse * delta)
	velocite = velocite.normalized() * vitesse
	var collision = move_and_collide(velocite *  delta)
	if collision:
		queue_free()
		print(collision.collider.name)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			
func hit():
	vie -=1 
	if vie == 0:
		queue_free()
	

