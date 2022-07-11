extends TextureRect

var _elapsed = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	# Want to transition from day to night every minute
	_elapsed += delta
	_elapsed = fmod(_elapsed,120.0)
	_adjust_rotation(_elapsed)
	
func _adjust_rotation(elapsed):
	var _rotation = deg2rad((elapsed * 3))
	set_rotation(_rotation)
