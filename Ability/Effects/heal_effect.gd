class_name HealEffect
extends Effect

func apply(ctx:EffectContext):
	finished.emit()

func undo(ctx:EffectContext):
	pass
