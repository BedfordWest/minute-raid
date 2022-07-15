extends Node

onready var _animation_player = $AnimationPlayer
onready var _animation_tree = $AnimationTree
onready var _animation_state = _animation_tree.get("parameters/playback")

func _ready():
	_animation_tree.active = true
	
func update_blends(input_vector):
	# If there is no input, maintain the previous one.
	# This means the character won't 'jump' back to standing left after moving
	# and will instead face whatever direction they had been moving.
	if input_vector == Vector2.ZERO:
		return
	
	var props = _animation_tree.get_property_list()
	for prop in props:
		var name = prop.name
		if "blend_position" in name:
			_animation_tree.set(name, input_vector)
	
func play(anim_node):
	if _animation_state.get_current_node() != anim_node:
		_animation_state.travel(anim_node)
