extends EntityState

# How often the enemy will randomize movement direction (in seconds)
const MOVE_CHANGE_FREQ = 3.0
const MOVE_SPEED = 15
const MOVE_ACCELERATION = 200
const MOVE_FRICTION = 200

onready var _move_timer = Timer.new()

func _ready():
	_configure_move_timer()
	
func update_physics(_delta):
	pass
	
func update_graphics(_delta):
	_animation_controller.play("Slide")
	
func attack():
	emit_signal("state_transition", "Attack")

func move():
	pass
	
func stop_chase(_area):
	pass
	
func chase():
	emit_signal("state_transition", "Chase")
	
func stop():
	emit_signal("state_transition", "Idle")
	
func damage():
	emit_signal("state_transition", "Damaged")
	
func enter():
	.enter()
	_set_move_physics()
	_randomize_direction()
	_move_timer.start()
	
func exit():
	.exit()
	_move_timer.stop()
	
func _set_move_physics():
	_physics.set_speed(MOVE_SPEED)
	_physics.set_acceleration(MOVE_ACCELERATION)
	_physics.set_friction(MOVE_FRICTION)
	
func _randomize_direction():
	var new_input_vec = Vector2.ZERO
	new_input_vec.x = rand_range(-1.0, 1.0)
	new_input_vec.y = rand_range(-1.0, 1.0)
	_movement.set_input_vector(new_input_vec.normalized())
	
func _configure_move_timer():
	_move_timer.set_wait_time(MOVE_CHANGE_FREQ)
	_move_timer.connect("timeout", self, "_move_timeout")
	_move_timer.set_autostart(true)
	add_child(_move_timer)
	
func _move_timeout():
	_randomize_direction()
