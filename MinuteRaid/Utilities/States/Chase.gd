extends EntityState

const CHASE_SPEED = 60
const CHASE_CHANGE_FREQ = 0.1
const CHASE_ACCELERATION = 200
const CHASE_FRICTION = 200

onready var _chase_timer = Timer.new()

func _ready():
	_configure_chase_timer()

# Enemies default to doing nothing when in idle
func update_physics(_delta):
	pass
	
func update_graphics(_delta):
	_animation_controller.play("Chase")
	
func enter():
	.enter()
	_set_chase_physics()
	_set_chase_direction()
	_chase_timer.start()
	
func exit():
	.exit()
	_chase_timer.stop()
	
func attack():
	emit_signal("state_transition", "Attack")

func move():
	pass
	
func stop():
	pass
	
func damage():
	emit_signal("state_transition", "Damaged")
	
func chase():
	pass
	
func _set_chase_physics():
	_physics.set_speed(CHASE_SPEED)
	_physics.set_acceleration(CHASE_ACCELERATION)
	_physics.set_friction(CHASE_FRICTION)
	
func _set_chase_direction():
	var target_pos = _entity.get_target().get_global_position()
	var physics_pos = _physics.get_global_position()
	var new_input_vec = physics_pos.direction_to(target_pos)
	_movement.set_input_vector(new_input_vec)
	
func _configure_chase_timer():
	_chase_timer.set_wait_time(CHASE_CHANGE_FREQ)
	_chase_timer.connect("timeout", self, "_chase_timeout")
	_chase_timer.set_autostart(false)
	add_child(_chase_timer)
	
func _chase_timeout():
	_set_chase_direction()
	
func stop_chase(area):
	if area == _entity.get_target():
		emit_signal("state_pop")
