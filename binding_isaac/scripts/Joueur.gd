extends KinematicBody2D

var Bullet = preload("res://Scenes/Balle.tscn")
export(int) var speed = 300
var temps_rechargement = 0.5
onready var timer_Rechargement = $Timer
var bulletVelocity = 200


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	Mouvement(velocity)
	Animation_joueur()
	Lancer()


func Lancer():
		if $Timer.is_stopped() and Input.is_action_pressed("ui_up"):
			shoot()
			$Timer.start()


func shoot():
	
	pass


func Animation_joueur():
	if Input.is_action_pressed("A") and !Input.is_action_pressed("S") and !Input.is_action_pressed("W"):
		$Isaak.play("Gauche")

	elif Input.is_action_pressed("D") and !Input.is_action_pressed("S") and !Input.is_action_pressed("W"):
		$Isaak.play("Droite")


	if Input.is_action_pressed("W"):
		if Input.is_action_pressed("A"):
			$Isaak.play("Gauche")
		elif Input.is_action_pressed("D"):
			$Isaak.play("Droite")
		else:
			$Isaak.play("Haut")


	if Input.is_action_pressed("S"):
		if Input.is_action_pressed("A"):
			$Isaak.play("Gauche")
		elif Input.is_action_pressed("D"):
			$Isaak.play("Droite")
		else:
			$Isaak.play("Bas")


	if Input.is_action_just_released("W"):
		$Isaak.play("Inactif")

	if Input.is_action_just_released("S"):
		$Isaak.play("Inactif")

	if Input.is_action_just_released("A"):
		$Isaak.play("Inactif")

	if Input.is_action_just_released("D"):
		$Isaak.play("Inactif")


func Mouvement(velocity):
	if Input.is_action_pressed("W"):
		velocity.y -= 1
	if Input.is_action_pressed("S"):
		velocity.y += 1
	if Input.is_action_pressed("A"):
		velocity.x -= 1
	if Input.is_action_pressed("D"):
		velocity.x += 1
	
	#Pour ne pas que le personnage bouge plus vite en diagonal que normalement
	velocity = velocity.normalized()
	
	move_and_slide(velocity * speed)
