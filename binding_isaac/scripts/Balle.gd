extends KinematicBody2D

# Déclaration des variables
var velocity = Vector2()


# Change la rotation et la vitesse d'un objet
func start(pos, x, y):
	position = pos
	velocity = Vector2(x, y)


# Pour donner un mouvement a un objet et le faire intéragire avec des collisions
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		queue_free()
		print(collision.collider.name)
		if collision.collider.has_method("hit"):
			print('toucher')
			collision.collider.hit()


# Lorsque la balle touche quelque chose, elle disparait.
func hit():
	queue_free()
