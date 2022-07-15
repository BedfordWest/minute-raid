extends Node

class_name State

var _entity #The entity this state is representing

signal state_entered
signal state_exited
# warning-ignore:unused_signal
signal state_pop
# warning-ignore:unused_signal
signal state_transition(to)

func enter():
	emit_signal("state_entered")

func exit():
	emit_signal("state_exited")

func set_entity(entity):
	_entity = entity
