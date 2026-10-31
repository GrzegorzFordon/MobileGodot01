class_name SequentialUse
extends AbilityUse

@export var uses : Dictionary[float,AbilityUse]

var active_uses : Array[AbilityUse]

func start_use(ctx:AbilityContext):pass

func end_use(ctx:AbilityContext):
	for active_use in active_uses:
		active_use.end_use(ctx)
	active_uses.clear()

func tick(ctx:AbilityContext, delta):
	super(ctx,delta)
	for key in uses.keys():
		if key > time_since_start_use: continue
		if active_uses.has(uses[key]): continue
		uses[key].start_use(ctx)
		active_uses.append(uses[key])
