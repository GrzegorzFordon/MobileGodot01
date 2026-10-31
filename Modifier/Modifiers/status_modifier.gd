class_name StatusModifier
extends Modifier

#nimble means walking sideways/backwards isn't slower
enum TYPE {SILENCED,FROZEN,POISONED,ROOTED,STUNNED,NIMBLE}
@export var type : TYPE

func apply(ctx:AbilityContext):
	for target in ctx.target:
		target.modifiers.add_modifier(self)

func remove(ctx:AbilityContext):
	for target in ctx.target:
		target.modifiers.remove_modifier(self)
