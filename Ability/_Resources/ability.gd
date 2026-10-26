class_name Ability
extends Resource

#@export var costs : Array[AbilityCost]
#@export var requirements : Array[AbilityRequirement]
@export var target : AbilityTarget
@export var effects : Array[AbilityEffect]

func resolve(ctx:AbilityContext):
	target.set_targets(ctx)
	for effect in effects:
		effect.apply(ctx)

func undo(ctx:AbilityContext):
	for effect in effects:
		effect.undo(ctx)
