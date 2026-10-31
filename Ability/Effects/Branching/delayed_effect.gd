class_name DelayedEffect
extends AbilityEffect

@export var duration : float
@export var effects : Array[AbilityEffect]


func apply(ctx:AbilityContext):
	finished.emit()

func undo(ctx:AbilityContext):
	pass
