@abstract
class_name AbilityUse
extends Resource

signal finished()

@export var abilities : Array[Ability]
@export var max_duration : float

var time_since_start_use : float

@abstract func start_use(ctx:AbilityContext)
@abstract func end_use(ctx:AbilityContext)

func tick(ctx:AbilityContext, delta):
	time_since_start_use += delta

func use(ctx:AbilityContext):
	for ability in abilities:
		ability.resolve(ctx)
