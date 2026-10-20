@abstract
class_name SpellCast
extends Resource

@export var ability_resolvers : Array[AbilityResolver]

@abstract func start_cast(ctx:AbilityContext)
@abstract func cancel_cast()

func cast(ctx:AbilityContext):
	for resolver in ability_resolvers: resolver.resolve(ctx)
