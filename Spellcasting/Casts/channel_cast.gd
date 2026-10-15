class_name ChannelCast
extends SpellCastData

@export var repeat_delta : float
var timer : SceneTreeTimer

func start_cast(effects:Array[SpellEffect],ctx:SpellContext):
	if repeat_delta:
		timer = ctx.source.get_tree().create_timer(repeat_delta)
		timer.timeout.connect(cast)

func cancel_cast(effects:Array[SpellEffect]):
	timer.timeout.disconnect(cast)
	timer = null
