extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func save():
	var saveDictionary = {
		"PlayerPosX": player.position.x,
		"PlayerPosY": player.position.y
	}
	var file = File.new()
	file.open("saveGame.json", File.WRITE)
	file.store_line(to_json(saveDictionary))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
