extends KinematicBody2D

#Class variables
var velocity = Vector2(0,0)
var MAX_SPEED = 400
var ACCELERATION = 300

#The object that we will be using as bullets
var bullet = preload("res://Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Shoot a bullet
func shoot():
	var b = bullet.instance()
	b.velocity = Vector2(0,-500).rotated(rotation)
	b.position = position
	get_parent().bullets.push_back(b)
	get_parent().add_child(b)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Move Forward in direction ship is facing
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2(0,-ACCELERATION).rotated(rotation) * delta
		if velocity.length() > MAX_SPEED:
			#Ensure ship is slower than max speed
			velocity = velocity.normalized() * MAX_SPEED
	else:
		#Deceleration
		velocity *= 0.995
	
	#Turn Right
	if Input.is_action_pressed("ui_right"):
		rotation+=5 * delta
	
	#Turn Left
	if Input.is_action_pressed("ui_left"):
		rotation-=5 * delta
	
	#Shoot a bullet
	if Input.is_action_just_pressed("gameplay_shoot"):
		shoot()
	
	#Move ship each frame
	velocity = move_and_slide(velocity, Vector2(0,0))
	#position+=velocity * delta
	pass
