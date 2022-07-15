extends EntityState

const MOVE_ACCELERATION = 325
const MOVE_FRICTION = 500
const MOVE_SPEED = 55

func update_physics(_delta):
	pass
	
func update_graphics(_delta):
	_animation_controller.play("Walk")
	
func enter():
	.enter()
	_set_move_physics()
	
func _set_move_physics():
	_physics.set_speed(MOVE_SPEED)
	_physics.set_acceleration(MOVE_ACCELERATION)
	_physics.set_friction(MOVE_FRICTION)
	
func attack():
	emit_signal("state_transition", "Attack")
	
func move():
	pass
	
func stop():
	emit_signal("state_transition", "Idle")
	
func damage():
	emit_signal("state_transition", "Damaged")
