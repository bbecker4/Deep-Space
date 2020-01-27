extends Node2D

onready var player = $Player

#Save player to function
func save():
	var saveDictionary = {
		"PlayerPosX": player.position.x,
		"PlayerPosY": player.position.y,
		"PlayerAcceleration": player.ACCELERATION,
		"PlayerMaxSpeed": player.MAX_SPEED
	}
	var file = File.new()
	file.open("res://saveGame.json", File.WRITE)
	file.store_line(to_json(saveDictionary))

func loadSettings():
	var settingsFile = File.new()
	if not settingsFile.file_exists("res://saveGame.json"):
		return
	
	settingsFile.open("res://saveGame.json", File.READ)
	var line = parse_json(settingsFile.get_line())
	player.position.x = line["PlayerPosX"]
	player.position.y = line["PlayerPosY"]
	player.ACCELERATION = line["PlayerAcceleration"]
	player.MAX_SPEED = line["PlayerMaxSpeed"]

# Called when the node enters the scene tree for the first time.
func _ready():
	#save()
	loadSettings()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
