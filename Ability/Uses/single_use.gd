class_name SingleUse
extends AbilityUse

@export_range(0.0,5.0,0.1) var setup_time : float

var timer : SceneTreeTimer

func start_use(ctx:AbilityContext):
	if setup_time:
		timer = ctx.source.get_tree().create_timer(setup_time)
		timer.timeout.connect(use.bind(ctx))
	else:
		use(ctx)

func end_use(ctx:AbilityContext):pass
