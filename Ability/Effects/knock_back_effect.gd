class_name KnockBackEffect
extends Effect

func apply(ctx:EffectContext):
	finished.emit()

func undo(ctx:EffectContext):
	pass
