extends GameState

var _text = preload("res://UI/GameOverText.tscn")
onready var GUI = get_tree().get_root().get_node("World/CanvasLayer/GUI")
onready var minimap = get_tree().get_root().get_node("World/CanvasLayer/MiniMap")

func enter():
	.enter()
	var lights = get_tree().get_nodes_in_group("entity_lights")
	for light in lights:
		light.dim_off()
	var text = _text.instance()
	var stats = get_tree().get_root().get_node("World/CanvasLayer/Stats")
	text.set_position(Vector2(stats.rect_size/2))
	stats.add_child(text)
	GUI.hide()
	minimap.hide()

func game_over():
	pass
	
func title():
	pass
	
func action():
	pass
	
func strategy():
	pass

func process_input():
	if Input.is_action_just_pressed("ui_end"):
		get_tree().quit()
	if Input.is_action_just_pressed("ui_restart"):
		var err = get_tree().reload_current_scene()
		if err:
			print(err)
