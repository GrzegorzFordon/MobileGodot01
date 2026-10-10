class_name SingleTarget
extends SpellTarget

enum SINGLE_TARGET_TYPE { SOURCE, TARGET}
@export var type:SINGLE_TARGET_TYPE

func get_targets(ctx:SpellContext) -> Array[Node]:
	if type == SINGLE_TARGET_TYPE.SOURCE: return [ctx.source]
	if type == SINGLE_TARGET_TYPE.TARGET: return [ctx.target]
	return []
