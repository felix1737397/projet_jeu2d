extends KinematicBody2D


var Bullet = preload("res://scenes/bras_boss.tscn")
export var vie = 20
export var rotate = 1
var velocite = Vector2()
var bulletVelocity = 1000
var dir; 
var boucle = 0
	#var dir = (pos_joueur.global_position - global_position).normalized()
	#move_and_collide(dir * vitesse * delta)

onready var pos_joueur = get_parent().get_node("Joueur")


func _ready():
	var screenSize = get_viewport().get_visible_rect().size

func _physics_process(delta):	
	if vie > 0:
		Tirer()
		var collision = move_and_collide(velocite * delta)
		if collision:
			velocite = velocite.bounce(collision.normal)
			if collision.collider.has_method("hit"):
				collision.collider.hit()


func Tirer():
	if $Timer.is_stopped():
		print('stop')
		var b = Bullet.instance()
		b.start($position_tir_bras.global_position, 0)
		get_parent().add_child(b)
		$Sprite.play("Lancer_bras")
		$Timer.start()

func hit():
	vie -=10
	if vie == 0:
		$Sprite.play("mort")
		$CollisionShape2D.queue_free()
