extends CanvasModulate

onready var ColorUtils = preload("Utilities/ColorUtils.gd").new()

const DAY_COLOR = Color(0.97, 0.93, 0.68, 1)
const NIGHT_COLOR = Color(0.16, 0.16, 0.12, 1)

var _elapsed = 0

func _ready():
	set_color(ColorUtils.hsv_lerp(DAY_COLOR, NIGHT_COLOR, 0.5))

func _process(delta):
	# Want to transition from day to night every minute
	_elapsed += delta
	_elapsed = fmod(_elapsed,120.0)
	_shift_global_lighting(_elapsed)
		
func _shift_global_lighting(elapsed):
	var _interpolation = 0.0
	if elapsed >= 30.0 && elapsed < 90.0:
		_interpolation = (elapsed - 30.0)/60.0
		set_color(ColorUtils.hsv_lerp(DAY_COLOR, NIGHT_COLOR, _interpolation))
	elif elapsed >= 90.0:
		_interpolation = (elapsed - 90.0)/60.0
		set_color(ColorUtils.hsv_lerp(NIGHT_COLOR, DAY_COLOR, _interpolation))
	else:
		_interpolation = (elapsed + 30.0)/60.0
		set_color(ColorUtils.hsv_lerp(NIGHT_COLOR, DAY_COLOR, _interpolation))
