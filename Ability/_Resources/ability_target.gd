@abstract
class_name AbilityTarget
extends Resource

@abstract func set_targets(ctx:AbilityContext)->AbilityContext

func filter_targets(ctx:AbilityContext):
	ctx.target = ctx.target.filter(not_equal_friendly.bind(ctx))

func not_equal_friendly(val:Entity,ctx:AbilityContext):
	return val.is_friendly != ctx.source.is_friendly
