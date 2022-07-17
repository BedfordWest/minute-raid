extends Node

class_name LivingEntity

var _last_hit_by
var _defense = 1 setget , get_defense
var health = 10

onready var _physics = get_owner()
onready var _animation_controller = get_node("AnimationController")
onready var _movement = get_node("Movement")
onready var _state_machine = get_node("StateMachine")
onready var _sprite = get_node("Drawing/Character")

func _ready():
	_state_machine.set_state_entities(self)	
	
func _process(delta):
	if(health <= 0):
		die()

func get_physics():
	return _physics
	
func get_sprite():
	return _sprite
	
func get_hit_by():
	return _last_hit_by
	
func set_hit_by(area):
	_last_hit_by = area
	
func get_movement():
	return _movement
	
func get_animation_controller():
	return _animation_controller
	
func get_defense():
	return _defense
	
func take_damage(power):
	var damage = calc_damage(power)
	$FCTManager.show_value(damage)
	health -= damage
	
func calc_damage(power):
	var damage = power - get_defense()
	return damage
	
func die():
	pass
