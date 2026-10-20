class_name SimpleCast
extends SpellCast

@export_range(0.0,5.0,0.1) var casting_time : float

var timer : SceneTreeTimer

func start_cast(ctx:AbilityContext):
	if casting_time:
		timer = ctx.source.get_tree().create_timer(casting_time)
		timer.timeout.connect(cast.bind(ctx))
	else:
		cast(ctx)

func cancel_cast():
	if timer: timer.timeout.disconnect(cast)
	timer = null
