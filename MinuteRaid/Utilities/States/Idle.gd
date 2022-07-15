extends EntityState

const IDLE_ACCELERATION = 500
const IDLE_FRICTION = 500
const IDLE_SPEED = 0

# Default to doing nothing when in idle
func update_physics(_delta):
	pass
	
func update_graphics(_delta):
	_animation_controller.play("Stand")
	
func enter():
	.enter()
	_set_idle_physics()
	
func _set_idle_physics():
	_physics.set_speed(IDLE_SPEED)
	_physics.set_acceleration(IDLE_ACCELERATION)
	_physics.set_friction(IDLE_FRICTION)

func attack():
	emit_signal("state_transition", "Attack")

func move():
	emit_signal("state_transition", "Move")
	
func stop():
	pass

func damage():
	emit_signal("state_transition", "Damaged")
