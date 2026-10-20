class_name ResourceCost
extends AbilityCost

@export var type : Entity.RESOURCE_TYPE
@export var amount : int

func can_pay(ctx:AbilityContext)->bool:
	var has_resource = ctx.source.resource_meters.has(type)
	if not has_resource: return false
	var meter = ctx.source.resource_meters[type]
	var can_use = meter.can_use(amount)
	return can_use

func pay(ctx:AbilityContext):
	var meter = ctx.source.resource_meters[type]
	if not meter: return
	meter.try_use(amount)
