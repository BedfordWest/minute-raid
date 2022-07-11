extends CanvasModulate

const DAY_COLOR = Color(0.97, 0.93, 0.68, 1)
const NIGHT_COLOR = Color(0.16, 0.16, 0.12, 1)

var _elapsed = 0

func _ready():
	set_color(hsv_lerp(DAY_COLOR, NIGHT_COLOR, 0.5))

func _process(delta):
	# Want to transition from day to night every minute
	_elapsed += delta
	_elapsed = fmod(_elapsed,120.0)
	var _interpolation = 0.0
	if _elapsed >= 30.0 && _elapsed < 90.0:
		_interpolation = (_elapsed - 30.0)/60.0
		set_color(hsv_lerp(DAY_COLOR, NIGHT_COLOR, _interpolation))
	elif _elapsed >= 90.0:
		_interpolation = (_elapsed - 90.0)/60.0
		set_color(hsv_lerp(NIGHT_COLOR, DAY_COLOR, _interpolation))
	else:
		_interpolation = (_elapsed + 30.0)/60.0
		set_color(hsv_lerp(NIGHT_COLOR, DAY_COLOR, _interpolation))
		
func hsv_lerp(cola, colb, t):
	#This part will flip the direction of the lerp if the two colors are above
	 #180 degrees apart, this way the lerp always takes the shortest path.
	var h
	var ha = cola.h
	var hb = colb.h
	var d = hb - ha
	if ha <= hb:
		if d > 0.5:
			h = fmod(lerp(ha + 1, hb, t), 1)
		else:
			h = lerp(ha, hb, t)
	else:
		d = -d
		if d > 0.5:
			h = fmod(lerp(ha, hb + 1, t), 1)
		else:
			h = lerp(ha, hb, t)

	#Setting the color
	var newcol = Color()
	newcol.v = lerp(cola.v, colb.v, t)
	newcol.s = lerp(cola.s, colb.s, t)
	newcol.h = h

	return newcol
