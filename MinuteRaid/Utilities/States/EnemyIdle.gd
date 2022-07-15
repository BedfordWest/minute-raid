extends EntityState

# Enemies default to doing nothing when in idle
func update_physics(_delta):
	move()
	
func update_graphics(_delta):
	_animation_controller.play("Idle")
	
func attack():
	emit_signal("state_transition", "Attack")

func move():
	emit_signal("state_transition", "Move")
	
func chase():
	emit_signal("state_transition", "Chase")
	
func damage():
	emit_signal("state_transition", "Damage")
	
func stop_chase(_area):
	pass
	
func stop():
	pass
