extends KinematicBody2D

# Déclaration des variables
var velocity = Vector2()


# Change la rotation et la vitesse d'un objet
func start(pos, x, y):
	position = pos
	velocity = Vector2(x, y)


# Pour donner un mouvement a un objet et le faire intéragir avec des collisions
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
			if collision.collider.has_method("collision_balle"):
				collision.collider.collision_balle()
			queue_free()
			
		


# Lorsque la balle touche quelque chose, elle disparait.
func hit():
	queue_free()
	
	
	
