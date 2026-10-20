class_name ReceiveSecondaryResourceEffect
extends Effect

@export var amount : float
@export var secondary_resource_name : String

func apply(ctx:EffectContext):
	finished.emit()

func undo(ctx:EffectContext):
	pass
