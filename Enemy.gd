extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum AI_STATE { IDLE, WANDERING, PURSUING, EVADING, RELOADING };

var state = AI_STATE.IDLE;

func _idle():
	pass
	
func _wander():
	pass

func _pursue():
	pass

func _evade():
	pass
	
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
