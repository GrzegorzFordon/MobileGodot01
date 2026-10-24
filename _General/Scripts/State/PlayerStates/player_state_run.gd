class_name PlayerStateRun
extends PlayerState

func enter()->void:
	super()
	pass

func exit()->void:
	pass

func physics_tick(delta)->void:
	_move_player(cached_input_data)

func _check_transitions(input_data:InputData)->void:
	if input_data.just_pressed_actions.has("JUMP"):
		transition.emit(STATE_STRINGS.JUMP)
	if input_data.direction.length()==0.0:
		transition.emit(STATE_STRINGS.IDLE)
