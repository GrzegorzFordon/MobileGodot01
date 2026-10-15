class_name DealDamageEffect
extends SpellEffect

@export var amount:=10.0

func apply(ctx:SpellContext):
	for target in ctx.target:
		target.health.try_use(amount)
		print("dealing ",amount," to ", target)
	pass

func undo(ctx:SpellContext):
	pass
