class_name ConditionalEffect
extends Effect

@export var requirements : Array[Requirement]
@export var effects : Array[Effect]

func apply(ctx:EffectContext):
	var failed_requirements = requirements.any(func(req):return req.is_fulfilled(ctx))
	if failed_requirements: return
	for effect in effects: effect.execute(ctx)
	finished.emit()

func undo(ctx:EffectContext):
	for effect in effects: effect.undo(ctx)
