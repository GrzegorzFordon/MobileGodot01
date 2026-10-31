class_name PullUse
extends AbilityUse

#Show Aim on tick, use on release

func start_use(ctx:AbilityContext):
	pass

func end_use(ctx:AbilityContext):
	ctx.context["PROJECTILE_DIR"] = -ctx.source.basis.z #TODO - change to using input
	use(ctx)
