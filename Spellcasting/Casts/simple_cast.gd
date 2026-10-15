class_name SimpleCast
extends SpellCastData

@export var casting_time : float

var timer : SceneTreeTimer

func start_cast(effects:Array[SpellEffect],ctx:SpellContext):
	if casting_time:
		timer = ctx.source.get_tree().create_timer(casting_time)
		timer.timeout.connect(cast.bind(effects,ctx))
	else:
		cast(effects,ctx)

func cancel_cast(effects:Array[SpellEffect]):
	if timer: timer.timeout.disconnect(cast)
	timer = null
