class_name ApplyAuraEffect
extends AbilityEffect

@export var aura : Aura

func apply(ctx:AbilityContext):
	for target in ctx.target:
		target.aura_holder.add_aura(aura)

func undo(ctx:AbilityContext):
	pass
