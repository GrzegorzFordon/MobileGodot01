class_name RandomChanceRequirement
extends AbilityRequirement

@export_range(0.0,1.0,0.1) var chance

func is_fulfilled(ctx:AbilityContext)->bool:
	var rnd = randf()
	return chance >= rnd
