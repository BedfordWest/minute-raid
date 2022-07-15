class_name StateMachine
extends Node
# A finite state machine which handles basic push/pop transitions between states

const DEBUG = false

var _state: Object
var _history = []

func _ready():
	# Set the initial state to the first child node
	_state = get_child(0)
	
func current():
	return _state
	
func prev():
	var size = _history.size()
	if size > 0:
		return _history[size - 1]
	else:
		return false
		
# Each state needs an entity it represents, this method will set the entity
#     for each state in this state machine
func set_state_entities(entity):
	for node in get_children():
		node.set_entity(entity)
	
func _push(newState):
	_exit_state()
	_history.append(_state)
	_state = get_node(newState.name)
	_enter_state()

func _pop():
	if _history.size() > 0:
		_exit_state()
		_state = get_node(_history.pop_back().name)
		_enter_state()
		
func in_stack(whatState, howFar):
	if whatState == _state:
		return true
	var length = _history.size()
	
	var from = length - howFar
	
	#the find() method for arrays returns -1 if not found, so convert to bool
	return bool(_history.find(whatState, from) + 1)

func _enter_state():
	if DEBUG:
		print("Entering state: ", _state.name)
	# Give the new state a reference to this state machine script
	_state.enter()
	
func _exit_state():
	if DEBUG:
		print("Exiting state: ", _state.name)
	_state.exit()
	
func reset_to_current():
	_history = []

func _on_state_transition(to: String):
	var prev_name = "empty"
	var prev = prev()
	if prev:
		prev_name = prev.name
	if to in prev_name:
		_pop()
	else:
		_push(get_node(to))
		
func _on_state_pop():
	_pop()
