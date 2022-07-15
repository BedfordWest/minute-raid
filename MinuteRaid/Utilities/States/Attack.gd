extends EntityState

const SLASH_SPEED = 1.0
const TIMESCALE = 6.0
const ATTACK_SPEED = SLASH_SPEED/TIMESCALE

var _slash

onready var _attack_timer = Timer.new()

func _ready():
	_attack_timer.set_wait_time(ATTACK_SPEED)
	_attack_timer.connect("timeout", self, "_attack_timeout")
	_attack_timer.set_one_shot(true)
	add_child(_attack_timer)

func enter():
	.enter()
	_attack_timer.start()
	
func exit():
	.exit()

# Enemies default to doing nothing when in idle
func update_physics(_delta):
	pass

func update_graphics(_delta):
	if _entity.get_movement().get_input_vector() == Vector2.ZERO:
		_animation_controller.play("StandAttack")
	else:
		_animation_controller.play("WalkAttack")
		
func attack():
	pass

# Stay in attack state if asked to transition to move or stop
func move():
	pass
	
func stop():
	pass
	
func _attack_timeout():
	emit_signal("state_pop")
	
func set_entity(entity):
	.set_entity(entity)
	_slash =  entity.get_node("Drawing/Character/Slash")
	
func damage():
	emit_signal("state_transition", "Damaged")
