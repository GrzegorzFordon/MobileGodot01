class_name SpawnEntityEffect
extends Effect

@export var entity : PackedScene

func apply(ctx:EffectContext):
	finished.emit()

func undo(ctx:EffectContext):
	pass
