class_name DealDamageEffect
extends AbilityEffect

@export var amount := 10

func apply(ctx:AbilityContext):
	for target in ctx.target:
		target.resource_meters[Entity.RESOURCE_TYPE.HEALTH].try_use(amount)
		var hp_left = target.resource_meters[Entity.RESOURCE_TYPE.HEALTH].cur_value

func undo(ctx:AbilityContext):
	pass
