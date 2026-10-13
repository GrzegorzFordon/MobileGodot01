class_name ConditionalEffect
extends SpellEffect

@export var requirements : Array[SpellRequirement]
@export var effects : Array[SpellEffect]

func execute(ctx:SpellContext):
	var failed_requirements = requirements.any(func(req):return req.is_fulfilled(ctx))
	if failed_requirements: return
	for effect in effects: effect.execute(ctx)
