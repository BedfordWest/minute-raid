extends Node

class_name Movement

signal move
signal stop

var _velocity = Vector2.ZERO
var _input_vector = Vector2.ZERO

func update_move(delta, physics):
	if _input_vector != Vector2.ZERO:
		_velocity  = _velocity.move_toward(_input_vector * physics.get_speed(), 
			physics.get_acceleration() * delta)
		emit_signal("move")
	else:
		_velocity = _velocity.move_toward(Vector2.ZERO, physics.get_friction() * delta)
		emit_signal("stop")
	_velocity = physics.move_and_slide(_velocity)
	
func set_input_vector(vector):
	_input_vector = vector
	
func get_input_vector():
	return _input_vector
