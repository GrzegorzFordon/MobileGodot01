class_name TeleportSpellEffect
extends AbilityEffect

@export var is_instant : bool
@export var distance : float

func apply(ctx:AbilityContext):
	finished.emit()

func undo(ctx:AbilityContext):
	pass
