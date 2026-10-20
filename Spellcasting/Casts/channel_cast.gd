class_name ChannelCast
extends SpellCast

@export_range(0.1,5.0,0.1) var repeat_delta : float
@export var costs : Array[AbilityCost]
var timer : SceneTreeTimer

func start_cast(ctx:AbilityContext):
	cast(ctx)
	if repeat_delta:
		set_timer(ctx)

func cancel_cast():
	if timer:
		for connection in timer.timeout.get_connections():
			timer.timeout.disconnect(connection["callable"])
		timer = null

func set_timer(ctx:AbilityContext):
		timer = ctx.source.get_tree().create_timer(repeat_delta)
		timer.timeout.connect(cast.bind(ctx))
		timer.timeout.connect(set_timer.bind(ctx))

func cast(ctx:AbilityContext):
	var can_cast = costs.all(func(cost:AbilityCost): return cost.can_pay(ctx))
	if not can_cast: return
	for cost in costs: cost.pay(ctx)
	super(ctx)
