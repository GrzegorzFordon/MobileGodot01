class_name ConditionalEffect
extends AbilityEffect

@export var requirements : Array[AbilityRequirement]
@export var effects : Array[AbilityEffect]

func apply(ctx:AbilityContext):
	var failed_requirements = requirements.any(func(req):return req.is_fulfilled(ctx))
	if failed_requirements: return
	for effect in effects: effect.apply(ctx)
	finished.emit()

func undo(ctx:AbilityContext):
	for effect in effects: effect.undo(ctx)
