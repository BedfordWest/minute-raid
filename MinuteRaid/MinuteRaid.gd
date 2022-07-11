extends Node2D

var _elapsed = 0

func _ready():
	Globals.gameState = Globals.State.DAY

func _process(delta):
	# Want to transition from day to night every minute
	_elapsed += delta
	_elapsed = fmod(_elapsed,120.0)
	if _elapsed < 60.0:
		Globals.gameState = Globals.State.DAY
	else:
		Globals.gameState = Globals.State.NIGHT
