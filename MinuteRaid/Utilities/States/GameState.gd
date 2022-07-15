class_name GameState extends State

var _player
var _movement

func set_entity(entity):
	.set_entity(entity)
	_player = _entity.get_player().get_node("Player")
	_movement = _player.get_movement()
