class_name RepeatedUse
extends AbilityUse

@export_range(0.1,5.0,0.1) var repeat_delta : float
@export var costs : Array[AbilityCost]

var timer : SceneTreeTimer

func start_use(ctx:AbilityContext):
	use(ctx)
	if repeat_delta:
		_set_timer(ctx)

func end_use(ctx:AbilityContext):
	if timer:
		for connection in timer.timeout.get_connections():
			timer.timeout.disconnect(connection["callable"])
		timer = null

func use(ctx:AbilityContext):
	var can_cast = costs.all(func(cost:AbilityCost): return cost.can_pay(ctx))
	if not can_cast: return
	for cost in costs: cost.pay(ctx)
	super(ctx)

func _set_timer(ctx:AbilityContext):
		timer = ctx.source.get_tree().create_timer(repeat_delta)
		timer.timeout.connect(use.bind(ctx))
		timer.timeout.connect(_set_timer.bind(ctx))
