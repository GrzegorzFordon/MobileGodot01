class_name PlayerStateRun
extends PlayerState

func enter(_data=null)->void:
	super(_data)
	pass

func exit()->void:
	super()
	pass

func tick(delta)->void:
	var movement_type = Movement.MOVE_TYPE.RUN
	_move_player(movement_type)
	super(delta)

func _check_transitions(input_data:InputData)->void:
	if player.velocity.y < 0:
		transition.emit(STATE_STRINGS.INAIR)
	if input_data.just_pressed_actions.has("JUMP"):
		transition.emit(STATE_STRINGS.JUMP)
	if input_data.direction.length()==0.0:
		transition.emit(STATE_STRINGS.IDLE)
	super(input_data)
