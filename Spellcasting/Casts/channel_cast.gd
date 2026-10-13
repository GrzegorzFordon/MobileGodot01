class_name ChannelCast
extends SpellCastData

@export var repeat_delta : float
var timer : SceneTreeTimer

func start_cast(spell_data:SpellData):
	if repeat_delta:
		#timer = get_tree().create_timer(repeat_delta)
		timer.timeout.connect(cast)

func cancel_cast(spell_data:SpellData):
	timer.timeout.disconnect(cast)
	timer = null

func cast(spell_data:SpellData):
	pass
