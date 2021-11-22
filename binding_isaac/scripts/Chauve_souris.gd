extends KinematicBody2D


export var vie = 1

var velocite = Vector2()

export var vitesse = 100

onready var pos_joueur = get_parent().get_node("Joueur")


func hit():
	
	vie -= 1
	if vie == 0:
		queue_free()


func _physics_process(delta):
	var dir = (pos_joueur.global_position - global_position).normalized()
	move_and_collide(dir * vitesse * delta)
	
	
	var collision = move_and_collide(velocite * delta)
	if collision:
		velocite = velocite.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
