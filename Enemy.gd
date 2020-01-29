extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum AI_STATE { IDLE, WANDERING, PURSUING, EVADING, RELOADING };

var state = AI_STATE.IDLE;

var distance_to_circle = 1.0

# function to process idle behaviour
func _idle():
	state = AI_STATE.WANDERING
	
# function to process wander behaviour
func _wander():
	pass

# function to process pursue behaviour
func _pursue():
	pass

# function to process evade behaviour
func _evade():
	pass
	
# function to process reload behaviour
func _reload():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (state == AI_STATE.IDLE):
		_idle()
	elif (state == AI_STATE.WANDERING):
		_wander()
	elif (state == AI_STATE.PURSUING):
		_pursue()
	elif (state == AI_STATE.EVADING):
		_evade()
	elif (state == AI_STATE.RELOADING):
		_reload()
