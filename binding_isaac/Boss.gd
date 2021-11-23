extends KinematicBody2D


var Bullet = preload("res://scenes/bras_boss.tscn")
export var vie = 2
export var rotate = 1
var velocite = Vector2()
var bulletVelocity = 1000
var point1 = Vector2(0,0)
var point2 = Vector2(0,0)
var time = 0
var timeDirection = 1
var moveDuration = 2
onready var pos_boss = get_parent().get_node("Boss")

	#var dir = (pos_joueur.global_position - global_position).normalized()
	#move_and_collide(dir * vitesse * delta)

onready var pos_joueur = get_parent().get_node("Joueur")
var dir

func _ready():
	var screenSize = get_viewport().get_visible_rect().size
	point1 = Vector2(screenSize.x * 0.1, screenSize.y * 0.6)
	point2 = Vector2(screenSize.x - (screenSize.x * 0.1), screenSize.y * 0.6)

func _physics_process(delta):	
	# Flip the direction of how time gets added
	# This ensures it moves back to its initial position
	if (time > moveDuration or time < 0):
		timeDirection *= -1

	# delta is how long it takes to complete a frame.
	time += delta * timeDirection
	var t = time / moveDuration
	pos_boss = lerp(point1,point2, t)
	if vie != 0:
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

