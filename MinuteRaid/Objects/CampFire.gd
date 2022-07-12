extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Globals.gameState == Globals.State.DAY):
		get_node("Fire").set_emitting(false)
		get_node("Smoke").set_emitting(true)
		get_node("Light").set_enabled(false)
	elif(Globals.gameState == Globals.State.NIGHT):
		get_node("Fire").set_emitting(true)
		get_node("Smoke").set_emitting(false)
		get_node("Light").set_enabled(true)
