class_name PlayerStateIdle
extends PlayerState

func enter()->void:
	super()

func exit()->void:
	pass

func physics_tick(delta)->void:
	_move_player(cached_input_data)

func _check_transitions(input_data:InputData)->void:
	var action_dict = {"A":0,"B":1,"C":2,"D":3}
	for key in action_dict.keys():
		if input_data.just_pressed_actions.has("ACTION_"+key):
			transition.emit(STATE_STRINGS.SPELLCAST)
	#if input_data.just_pressed_actions.has("USE_WEAPON"):
	if input_data.look_direction.length() > 0.2:
		transition.emit(STATE_STRINGS.USEWEAPON)
	#if input_data.direction.length()>0.0:
		#transition.emit(STATE_STRINGS.RUN)
