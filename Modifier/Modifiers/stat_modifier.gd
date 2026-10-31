class_name StatModifier
extends Modifier

enum TYPE {FLAT,MULT}

@export var stat : Stat.TYPE
@export var type : TYPE
@export var amount : float

func apply(ctx:AbilityContext):
	for target in ctx.target:
		target.stats.add_modifier(self,ctx.source)

func remove(ctx:AbilityContext):
	for target in ctx.target:
		#target.stats.
		pass
