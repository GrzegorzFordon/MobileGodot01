@abstract
class_name SpellCast
extends Resource

@export var abilities : Array[Ability]

@abstract func start_cast(ctx:AbilityContext)
@abstract func cancel_cast()

func cast(ctx:AbilityContext):
	for ability in abilities: ability.resolve(ctx)
