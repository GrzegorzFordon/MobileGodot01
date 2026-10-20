class_name DelayedEffect
extends Effect

func apply(ctx:EffectContext):
	finished.emit()

func undo(ctx:EffectContext):
	pass
