class_name PlayerStateSpellCasting
extends PlayerState

var active_spell_slot : int

func enter()->void:
	super()
	actor.spell_caster.cast_spell(0) #TODO - needs to know which spell to cast

func exit()->void:
	actor.spell_caster.finish_casting_spell(0)

func physics_tick(delta)->void:
	_move_player(cached_input_data)

func _check_transitions(input_data:InputData)->void:
	var action_dict = {"A":0,"B":1,"C":2,"D":3}
	for key in action_dict.keys():
		if input_data.just_released_actions.has("ACTION_"+key):
			transition.emit(STATE_STRINGS.IDLE)
