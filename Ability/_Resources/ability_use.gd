@abstract
class_name AbilityUse
extends Resource

@export var abilities : Array[Ability]
var time_since_start_use : float

@abstract func start_use(ctx:AbilityContext)
@abstract func end_use(ctx:AbilityContext)

#func tick(ctx:AbilityContext): time_since_start_use 

func use(ctx:AbilityContext):
	for ability in abilities:
		ability.resolve(ctx)
