class_name PlayerStateRun
extends PlayerState

func enter(_data=null)->void:
	super(_data)
	pass

func exit()->void:
	super()
	pass

func physics_tick(delta)->void:
	print(cached_input_data.direction)
	_move_player(cached_input_data,Movement.MOVE_TYPE.RUN)
	super(delta)

func _check_transitions(input_data:InputData)->void:
	if player.velocity.y < 0:
		transition.emit(STATE_STRINGS.INAIR)
	if input_data.just_pressed_actions.has("JUMP"):
		transition.emit(STATE_STRINGS.JUMP)
	if input_data.direction.length()==0.0:
		transition.emit(STATE_STRINGS.IDLE)
	super(input_data)
