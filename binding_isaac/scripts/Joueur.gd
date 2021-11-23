extends KinematicBody2D

var Bullet = preload("res://Scenes/Balle.tscn")
export(int) var speed = 300
var temps_rechargement = 0.35
onready var timer_Rechargement = $Timer
var bulletVelocity = 400
var player_vol = Vector2(1,1)
var old_player_pos

func _ready():
	old_player_pos = global_position

var velocity = Vector2()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	player_vol = global_position - old_player_pos
	old_player_pos = global_position
	
	Mouvement(velocity)
	Animation_sprite()
	Tirer()

func Tirer():
	if $Timer.is_stopped():
		if Input.is_action_just_pressed("ui_up"):
			var a = Bullet.instance()
			a.start($Haut.global_position, 0, -bulletVelocity)
			get_parent().add_child(a)
			$Timer.start()
		if Input.is_action_just_pressed("ui_down"):
			var b = Bullet.instance()
			b.start($Bas.global_position, 0, bulletVelocity)
			get_parent().add_child(b)
			$Timer.start()
		if Input.is_action_just_pressed("ui_right"):
			var c = Bullet.instance()
			c.start($Droite.global_position, bulletVelocity, 0)
			get_parent().add_child(c)
			$Timer.start()
		if Input.is_action_just_pressed("ui_left"):
			var d = Bullet.instance()
			d.start($Gauche.global_position, -bulletVelocity, 0)
			get_parent().add_child(d)
			$Timer.start()

func Animation_sprite():
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
	
	
func hit():
	
	VariableGlobales.joueur_vie -= 1
	queue_free()
	get_tree().change_scene("res://scenes/Menu_principal.tscn")
		
		
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
