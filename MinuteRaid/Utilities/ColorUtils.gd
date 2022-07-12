extends Node

# Interpolate between two colors via hsv (hue, saturation, value)
func hsv_lerp(cola, colb, time):
	#This part will flip the direction of the lerp if the two colors are above
	 # 180 degrees apart, this way the lerp always takes the shortest path.
	var hue
	var hue_a = cola.h
	var hue_b = colb.h
	var delta = hue_b - hue_a
	if hue_a <= hue_b:
		if delta > 0.5:
			hue = fmod(lerp(hue_a + 1, hue_b, time), 1)
		else:
			hue = lerp(hue_a, hue_b, time)
	else:
		delta = -delta
		if delta > 0.5:
			hue = fmod(lerp(hue_a, hue_b + 1, time), 1)
		else:
			hue = lerp(hue_a, hue_b, time)

	#Setting the color
	var newcol = Color()
	newcol.v = lerp(cola.v, colb.v, time)
	newcol.s = lerp(cola.s, colb.s, time)
	newcol.h = hue

	return newcol
