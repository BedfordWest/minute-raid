class_name EntityState extends State

var _animation_controller
var _physics
var _movement
var _sprite
	
func set_entity(entity):
	.set_entity(entity)
	_set_animation_controller()
	_set_physics()
	_set_movement()
	_set_sprite()
	
# Assume each entity will have exactly one animation controller
func _set_animation_controller():
	_animation_controller = _entity.get_animation_controller()
	
# Assume each entity will have exactly one physics controller
func _set_physics():
	_physics = _entity.get_physics()
	
func _set_movement():
	_movement = _entity.get_movement()
	
func _set_sprite():
	_sprite = _entity.get_sprite()
