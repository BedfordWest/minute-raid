extends GameState

func game_over():
	emit_signal("state_transition", "GameOver")

func title():
	pass
	
func action():
	pass
	
func strategy():
	pass

func process_input():
	if Input.is_action_just_pressed("attack"):
		_player.do_attack()
	if Input.is_action_just_pressed("minimap_toggle"):
		_entity._toggle_minimap()
	if Input.is_action_just_pressed("ui_end"):
		get_tree().quit()
	if Input.is_action_just_pressed("ui_restart"):
		var err = get_tree().reload_current_scene()
		if err:
			print(err)

	_movement.process_move_input()
