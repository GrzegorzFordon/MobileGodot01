class_name TeleportSpellEffect
extends Effect

@export var is_instant : bool

func apply(ctx:EffectContext):
	finished.emit()

func undo(ctx:EffectContext):
	pass
