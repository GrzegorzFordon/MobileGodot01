@abstract
class_name AbilityEffect
extends Resource

signal finished()

@abstract func apply(ctx:AbilityContext)
@abstract func undo(ctx:AbilityContext)
