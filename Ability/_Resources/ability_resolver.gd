class_name AbilityResolver
extends Resource

@export var target : AbilityTarget
@export var effects : Array[AbilityEffect]

func resolve(ctx:AbilityContext):
	target.set_targets(ctx)
	for effect in effects:
		effect.apply(ctx)
