extends EntityState

const RECOVERY_TIME = 0.2
const KNOCKBACK_SPEED = 300
const KNOCKBACK_ACCELERATION = 400
const KNOCKBACK_FRICTION = 10

onready var _recovery_timer = Timer.new()

func _ready():
	_recovery_timer.set_wait_time(RECOVERY_TIME)
	_recovery_timer.connect("timeout", self, "_recovery_timeout")
	_recovery_timer.set_one_shot(true)
	add_child(_recovery_timer)
				
func update_physics(_delta):
	pass
	
func update_graphics(_delta):
	_animation_controller.play("Stand")
	# Facing direction should be opposite of knockback
	_animation_controller.update_blends(-_movement.get_input_vector())
	
func attack():
	pass

func move():
	pass
	
func stop():
	pass
	
func damage():
	pass

func enter():
	.enter()
	_recovery_timer.start()
	_sprite.modulate = Color.red
	_trigger_knockback()
	
func exit():
	.exit()
	_sprite.modulate = Color(1,1,1)
	_entity.set_hit_by(null)
	
func _trigger_knockback():
	_set_knockback_physics()
	_set_knockback_direction()
	
func _set_knockback_physics():
	_physics.set_speed(KNOCKBACK_SPEED)
	_physics.set_acceleration(KNOCKBACK_ACCELERATION)
	_physics.set_friction(KNOCKBACK_FRICTION)
	
func _set_knockback_direction():
	var physics_pos = _physics.get_global_position()
	var hit_by_pos = _entity.get_hit_by().get_global_position()
	var new_input_vec = hit_by_pos.direction_to(physics_pos)
	_movement.set_input_vector(new_input_vec)

func _recovery_timeout():
	emit_signal("state_pop")
