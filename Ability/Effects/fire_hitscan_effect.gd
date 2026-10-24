class_name FireHitscanEffect
extends AbilityEffect

@export var on_hit_abilities : Array[Ability]

func apply(ctx:AbilityContext):
	#fire hitscan, set hit as ctx target, apply on_hit_abilities
	pass

func undo(ctx:AbilityContext):
	pass
