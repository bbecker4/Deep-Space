extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)
var MAX_SPEED = 400
var ACCELERATION = 300

var bullet = preload("res://Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Shoot a bullet
func shoot():
	var b = bullet.instance()
	b.velocity = Vector2(0,500).rotated(rotation)
	b.position = position
	get_parent().bullets.push_back(b)
	get_parent().add_child(b)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2(0,ACCELERATION).rotated(rotation) * delta
		if velocity.length() > MAX_SPEED:
			velocity = velocity.normalized() * MAX_SPEED
	else:
		velocity *= 0.995
	if Input.is_action_pressed("ui_right"):
		rotation+=5 * delta
	if Input.is_action_pressed("ui_left"):
		rotation-=5 * delta
	if Input.is_action_just_pressed("gameplay_shoot"):
		shoot()
	position+=velocity * delta
	pass
