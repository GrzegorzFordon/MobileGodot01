class_name SelfTarget
extends AbilityTarget

func set_targets(ctx:AbilityContext) -> AbilityContext:
	ctx.target = [ctx.source]
	return ctx
