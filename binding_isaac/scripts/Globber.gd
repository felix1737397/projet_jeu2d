extends KinematicBody2D


var Bullet = preload("res://scenes/BalleGlobber.tscn")
export var vie = 2
export var rotate = 1
var velocite = Vector2()
export var vitesse = 100


onready var pos_joueur = get_parent().get_node("Joueur")
var dir


func _physics_process(delta):	
	if vie != 0:
		Tirer()
	
	var collision = move_and_collide(velocite * delta)
	if collision:
		velocite = velocite.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()


func Tirer():
	if $Timer.is_stopped():
		$AnimatedSprite.play("Attaque")
		var b = Bullet.instance()
		b.start($Position2D.global_position, rotate)
		get_parent().add_child(b)
		$Timer.start()


func hit():
	vie -= 1
	if vie == 0:
		$AnimatedSprite.play("Cache")
		$CollisionShape2D.queue_free()
