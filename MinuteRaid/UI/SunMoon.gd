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
	# Want to be halfway around the circle after 60 seconds
	#   so multiply seconds by 3 (60 * 3 = 180 degrees)
	#   and don't forget to convert from degrees to radians!
	var _rotation = deg2rad((elapsed * 3))
	set_rotation(_rotation)
