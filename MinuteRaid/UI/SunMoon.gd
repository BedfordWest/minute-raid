extends TextureRect

var _elapsed = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	# Want to transition from day to night every minute
	_elapsed += delta
	_elapsed = fmod(_elapsed,120000.0)
	_adjust_rotation(_elapsed)
	
func _adjust_rotation(elapsed):
	var _rotation = (elapsed * 3)/100
	set_rotation(_rotation)
