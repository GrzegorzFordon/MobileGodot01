class_name InRangeTarget
extends SpellTarget

@export var range := 10.0

func get_targets(ctx:SpellContext) -> Array[Node]:
	var origin = ctx.source.global_position
	#TODO rest
	return []
